#!/usr/bin/env python3
"""Score a directory of generated modules (``<id>.v``) against the testbenches.

    python scripts/evaluate_verilog.py generated/finetuned --ids data/test_ids_dedup.txt \\
        --out results/finetuned.json

pass@1 is passed / total ids (missing files and missing testbenches count as failures).
"""

import argparse
import json
from collections import Counter
from pathlib import Path

from verilog_ft.simulate import run_files


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("generated_dir", type=Path, help="directory containing <id>.v files")
    ap.add_argument("--tests", type=Path, default=Path("generated_tests"))
    ap.add_argument("--ids", type=Path, default=None, help="file with one module ID per line; default: all .v files")
    ap.add_argument("--out", type=Path, default=None)
    args = ap.parse_args()

    if args.ids:
        ids = [ln.strip() for ln in args.ids.read_text().splitlines() if ln.strip()]
    else:
        ids = sorted(p.stem for p in args.generated_dir.glob("*.v"))

    per: dict[str, str] = {}
    for i in ids:
        mod, tb = args.generated_dir / f"{i}.v", args.tests / f"{i}_tb.v"
        if not mod.exists():
            per[i] = "missing_output"
        elif not tb.exists():
            per[i] = "no_testbench"
        else:
            per[i] = run_files(mod, tb).category
    counts = Counter(per.values())
    n = counts["pass"]
    summary = {
        "passed": n,
        "total": len(ids),
        "pass_at_1": round(n / len(ids), 4) if ids else 0.0,
        "categories": dict(counts),
        "per_module": per,
    }
    print(f"pass@1 = {summary['pass_at_1']:.3f} ({n}/{len(ids)})  {dict(counts)}")
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(summary, indent=1))


if __name__ == "__main__":
    main()
