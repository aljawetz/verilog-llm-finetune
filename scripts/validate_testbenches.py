#!/usr/bin/env python3
"""Check every generated testbench against its reference solution.

Writes a per-module status: ``pass_clean`` (prints PASS, no FAIL lines), or the failing
category (``wrong_output`` = prints FAIL lines, ``compile_error``, ``timeout``,
``no_output``). Needs a local VerilogDB and iverilog.

    python scripts/validate_testbenches.py --out results/reference_validation.json
"""

import argparse
import json
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

from verilog_ft.simulate import run_code


def check(args: tuple[str, Path, Path]) -> tuple[str, str]:
    module_id, db, tests = args
    spec = json.loads((db / f"{module_id}.json").read_text(encoding="utf-8"))
    res = run_code(
        spec.get("verilog_code", ""), (tests / f"{module_id}_tb.v").read_text(encoding="utf-8", errors="ignore")
    )
    return module_id, "pass_clean" if res.passed else res.category


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--verilog-db", type=Path, default=Path("VerilogDB"))
    ap.add_argument("--tests", type=Path, default=Path("generated_tests"))
    ap.add_argument(
        "--ids", type=Path, default=None, help="optional file of module IDs; default: all with spec+testbench"
    )
    ap.add_argument("--out", type=Path, default=Path("results/reference_validation.json"))
    ap.add_argument("--workers", type=int, default=8)
    args = ap.parse_args()

    tb_ids = {p.name.removesuffix("_tb.v") for p in args.tests.glob("*_tb.v")}
    ids = sorted(tb_ids & {p.stem for p in args.verilog_db.glob("*.json")})
    if args.ids:
        ids = [i for i in ids if i in {ln.strip() for ln in args.ids.read_text().splitlines()}]
    with ThreadPoolExecutor(args.workers) as ex:
        per = dict(ex.map(check, [(i, args.verilog_db, args.tests) for i in ids]))
    counts = dict(Counter(per.values()))
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(
        json.dumps(
            {
                "rule": "reference solution + testbench; pass_clean = prints PASS and no Error:/Failed/FAIL line",
                "counts": counts,
                "per_module": dict(sorted(per.items())),
            },
            indent=0,
        )
    )
    print(counts)


if __name__ == "__main__":
    main()
