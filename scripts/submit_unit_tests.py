#!/usr/bin/env python3
"""Submit OpenAI Batch jobs that generate Verilog testbenches from VerilogDB specs.

Builds JSONL shards, uploads each (purpose="batch") and creates one batch per shard
targeting /v1/chat/completions. Appends batch IDs to ``<out-dir>/batches.json`` so
``collect_unit_tests.py`` can pick them up.

    python scripts/submit_unit_tests.py --offset 0 --limit 1000

Requires OPENAI_API_KEY (environment or .env). Note the testbench prompt includes the
reference implementation (see ``verilog_ft.prompts.build_testbench_prompt``).
"""

import argparse
import json
import os
import sys
from datetime import datetime, timezone
from pathlib import Path

from dotenv import load_dotenv
from openai import OpenAI

from verilog_ft.prompts import TESTBENCH_SYSTEM_PROMPT, build_testbench_prompt


def write_jsonl_requests(spec_paths: list[Path], out_jsonl: Path, *, model: str, temperature: float) -> int:
    out_jsonl.parent.mkdir(parents=True, exist_ok=True)
    with open(out_jsonl, "w", encoding="utf-8") as f:
        for path in spec_paths:
            spec = json.loads(path.read_text(encoding="utf-8"))
            line = {
                "custom_id": path.stem,
                "method": "POST",
                "url": "/v1/chat/completions",
                "body": {
                    "model": model,
                    "messages": [
                        {"role": "system", "content": TESTBENCH_SYSTEM_PROMPT},
                        {"role": "user", "content": build_testbench_prompt(spec)},
                    ],
                    "temperature": temperature,
                },
            }
            f.write(json.dumps(line, ensure_ascii=False) + "\n")
    return len(spec_paths)


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--verilog-db", type=Path, default=Path("VerilogDB"))
    ap.add_argument("--out-dir", type=Path, default=Path("batch_jobs"))
    ap.add_argument("--model", default="gpt-4o-mini")
    ap.add_argument("--temperature", type=float, default=0.2)
    ap.add_argument("--offset", type=int, default=0, help="skip this many spec files (resume a partial run)")
    ap.add_argument("--limit", type=int, default=None, help="process at most this many specs")
    ap.add_argument(
        "--max-per-batch",
        type=int,
        default=500,
        help="requests per shard; keep each upload under OpenAI's file limit and the enqueued-token cap",
    )
    args = ap.parse_args()

    load_dotenv()
    if not os.environ.get("OPENAI_API_KEY"):
        sys.exit("Error: OPENAI_API_KEY is not set.")
    if not args.verilog_db.is_dir():
        sys.exit(f"Error: VerilogDB directory not found: {args.verilog_db}")

    specs = sorted(args.verilog_db.glob("*.json"))[args.offset :]
    if args.limit:
        specs = specs[: args.limit]
    if not specs:
        sys.exit("No specs to process.")

    client = OpenAI()
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    print(f"Preparing batch requests for {len(specs)} specs from {args.verilog_db}")

    infos: list[dict] = []
    for shard, start in enumerate(range(0, len(specs), args.max_per_batch)):
        jsonl = args.out_dir / f"unit_tests_{stamp}_shard{shard:03d}.jsonl"
        n = write_jsonl_requests(
            specs[start : start + args.max_per_batch], jsonl, model=args.model, temperature=args.temperature
        )
        with open(jsonl, "rb") as f:
            uploaded = client.files.create(file=f, purpose="batch")
        batch = client.batches.create(
            input_file_id=uploaded.id,
            endpoint="/v1/chat/completions",
            completion_window="24h",
            metadata={
                "job": "verilog-unit-tests",
                "created_at_utc": stamp,
                "requests": str(n),
                "shard_index": str(shard),
            },
        )
        infos.append(
            {
                "batch_id": batch.id,
                "input_jsonl": str(jsonl),
                "created_at_utc": stamp,
                "requests": n,
                "shard_index": shard,
            }
        )
        print(f"Shard {shard}: {n} requests -> batch {batch.id}")

    manifest = args.out_dir / "batches.json"
    existing: list[dict] = []
    if manifest.exists():
        try:
            existing = json.loads(manifest.read_text(encoding="utf-8")).get("batches", [])
        except json.JSONDecodeError:
            pass
    manifest.write_text(json.dumps({"batches": existing + infos}, indent=2), encoding="utf-8")
    print(f"Wrote batch metadata: {manifest}")


if __name__ == "__main__":
    main()
