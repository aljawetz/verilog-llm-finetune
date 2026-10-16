#!/usr/bin/env python3
"""Rebuild the train/test chat datasets and the evaluation set from a local copy of VerilogDB.

VerilogDB is not redistributed with this repo (see README, "Data"). Put your own copy
at ``VerilogDB/<module_id>.json``; module IDs come from ``generated_tests/*_tb.v``.

    python scripts/build_dataset.py

Writes ``train.jsonl``, ``test.jsonl``, ``split.json``, ``test_ids.txt`` and ``test_ids_dedup.txt``
(the evaluation set) to ``--out``. The evaluation set keeps held-out modules that have no
identical-code copy in the training set and whose testbench passes against its reference
solution (``results/reference_validation.json``).
"""

import argparse
import json
from pathlib import Path

from verilog_ft.dataset import SEED, SPLIT_RATIO, build_records, clean_eval_ids, public, random_split


def write_jsonl(path: Path, records: list[dict]) -> None:
    with path.open("w", encoding="utf-8") as f:
        for rec in records:
            f.write(json.dumps(public(rec)) + "\n")


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--verilog-db", type=Path, default=Path("VerilogDB"))
    ap.add_argument("--tests", type=Path, default=Path("generated_tests"))
    ap.add_argument("--out", type=Path, default=Path("data"))
    ap.add_argument("--seed", type=int, default=SEED)
    ap.add_argument("--reference-validation", type=Path, default=Path("results/reference_validation.json"))
    args = ap.parse_args()

    records, skipped = build_records(args.verilog_db, args.tests)
    print(f"Built {len(records)} records ({len(skipped)} skipped: {skipped[:5]})")

    train, test = random_split(records, seed=args.seed)
    per = json.loads(args.reference_validation.read_text())["per_module"]
    eval_ids = clean_eval_ids(train, test, {i for i, status in per.items() if status == "pass_clean"})

    args.out.mkdir(parents=True, exist_ok=True)
    write_jsonl(args.out / "train.jsonl", train)
    write_jsonl(args.out / "test.jsonl", test)
    meta = {
        "total": len(records),
        "train": len(train),
        "test": len(test),
        "split_ratio": SPLIT_RATIO,
        "seed": args.seed,
        "train_ids": sorted(r["id"] for r in train),
        "test_ids": sorted(r["id"] for r in test),
    }
    (args.out / "split.json").write_text(json.dumps(meta, indent=2), encoding="utf-8")
    (args.out / "test_ids.txt").write_text("\n".join(meta["test_ids"]) + "\n", encoding="utf-8")
    (args.out / "test_ids_dedup.txt").write_text("\n".join(sorted(eval_ids)) + "\n", encoding="utf-8")
    print(
        f"total {meta['total']}  train {meta['train']}  test {meta['test']}  eval set {len(eval_ids)}  -> {args.out}/"
    )


if __name__ == "__main__":
    main()
