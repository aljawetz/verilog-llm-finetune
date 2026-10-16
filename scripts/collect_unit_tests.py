#!/usr/bin/env python3
"""Collect OpenAI Batch outputs and write validated testbenches.

Reads ``<manifest-dir>/batches.json`` (written by ``submit_unit_tests.py``), polls until
each batch finishes, and for every response keeps the testbench only if it passes
against the reference solution under the project's scoring rule
(``verilog_ft.simulate``: compiles, prints PASS, prints no Error:/Failed/FAIL).
Validated testbenches are written to ``<out-dir>/<module_id>_tb.v``.

    python scripts/collect_unit_tests.py
"""

import argparse
import json
import os
import sys
import time
from pathlib import Path

from dotenv import load_dotenv
from openai import OpenAI

from verilog_ft.generation import strip_markdown_fences
from verilog_ft.simulate import run_code

TERMINAL = {"completed", "failed", "cancelled", "expired"}


def download_text(client: OpenAI, file_id: str) -> str:
    content = client.files.content(file_id)
    data = content.read() if hasattr(content, "read") else content
    return data.decode("utf-8") if isinstance(data, bytes) else str(data)


def completion_text(body: dict) -> str:
    choices = body.get("choices") or []
    return ((choices[0].get("message") or {}).get("content") or "") if choices else ""


def wait(client: OpenAI, batch_id: str, poll_seconds: int):
    while True:
        batch = client.batches.retrieve(batch_id)
        print(f"Batch {batch_id}: status={batch.status}")
        if batch.status in TERMINAL:
            return batch
        time.sleep(poll_seconds)


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--manifest-dir", type=Path, default=Path("batch_jobs"))
    ap.add_argument("--out-dir", type=Path, default=Path("generated_tests"))
    ap.add_argument("--verilog-db", type=Path, default=Path("VerilogDB"))
    ap.add_argument("--poll-seconds", type=int, default=60)
    ap.add_argument("--no-poll", action="store_true", help="do not wait for unfinished batches")
    args = ap.parse_args()

    load_dotenv()
    if not os.environ.get("OPENAI_API_KEY"):
        sys.exit("Error: OPENAI_API_KEY is not set.")
    manifest = args.manifest_dir / "batches.json"
    if not manifest.is_file():
        sys.exit(f"Error: {manifest} not found. Run scripts/submit_unit_tests.py first.")
    entries = json.loads(manifest.read_text(encoding="utf-8")).get("batches") or []
    if not entries:
        sys.exit(f"Error: no batches listed in {manifest}")

    client = OpenAI()
    args.out_dir.mkdir(parents=True, exist_ok=True)
    totals = {"ok": 0, "api_failed": 0, "invalid": 0}

    for entry in entries:
        batch_id = entry.get("batch_id")
        if not batch_id:
            continue
        batch = client.batches.retrieve(batch_id)
        if not args.no_poll and batch.status not in TERMINAL:
            batch = wait(client, batch_id, args.poll_seconds)
        if batch.status != "completed" or not batch.output_file_id:
            print(f"Batch {batch_id}: status={batch.status}, no output; skipping.", file=sys.stderr)
            continue

        ok = api_failed = invalid = 0
        for line in download_text(client, batch.output_file_id).splitlines():
            if not line.strip():
                continue
            row = json.loads(line)
            cid = row.get("custom_id") or ""
            resp = row.get("response")
            if row.get("error") or not resp or resp.get("status_code") != 200:
                api_failed += 1
                print(f"  {cid}: API failure", file=sys.stderr)
                continue
            tb = strip_markdown_fences(completion_text(resp.get("body") or {}))
            spec_path = args.verilog_db / f"{cid}.json"
            if not tb or not spec_path.exists():
                api_failed += 1
                print(f"  {cid}: empty response or spec missing", file=sys.stderr)
                continue
            solution = json.loads(spec_path.read_text(encoding="utf-8")).get("verilog_code", "").strip()
            result = run_code(solution, tb)
            if not result.passed:
                invalid += 1
                print(f"  {cid}: rejected ({result.category}: {result.message[:80]})", file=sys.stderr)
                continue
            (args.out_dir / f"{cid}_tb.v").write_text(tb, encoding="utf-8")
            ok += 1
        for k, v in (("ok", ok), ("api_failed", api_failed), ("invalid", invalid)):
            totals[k] += v
        print(f"Batch {batch_id}: wrote {ok}, API failures {api_failed}, validation failures {invalid}")

    print(f"Done. {totals}")


if __name__ == "__main__":
    main()
