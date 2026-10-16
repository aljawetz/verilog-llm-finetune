"""Build chat-format records from a local VerilogDB and split them train/test."""

from __future__ import annotations

import hashlib
import json
import random
import re
from pathlib import Path

from .prompts import build_prompt

SPLIT_RATIO = 0.8
SEED = 42


def normalize_code(code: str) -> str:
    """Strip comments and all whitespace, for exact-duplicate detection."""
    code = re.sub(r"/\*.*?\*/", "", code, flags=re.S)
    code = re.sub(r"//[^\n]*", "", code)
    return re.sub(r"\s+", "", code)


def build_records(
    verilog_db: Path, tests_dir: Path, allowed_ids: set[str] | None = None
) -> tuple[list[dict], list[str]]:
    """One chat record per testbench in ``tests_dir`` that has a spec in ``verilog_db``.

    Returns ``(records, skipped_ids)``. Records carry the normalized-code hash under
    ``_code_hash`` (stripped before writing) for duplicate detection.
    """
    records, skipped = [], []
    for tb in sorted(tests_dir.glob("*_tb.v")):
        module_id = tb.stem.removesuffix("_tb")
        if allowed_ids is not None and module_id not in allowed_ids:
            continue
        spec_path = verilog_db / f"{module_id}.json"
        if not spec_path.exists():
            skipped.append(module_id)
            continue
        spec = json.loads(spec_path.read_text(encoding="utf-8"))
        code = spec.get("verilog_code", "").strip()
        if not code:
            skipped.append(module_id)
            continue
        records.append(
            {
                "id": module_id,
                "messages": [
                    {"role": "user", "content": build_prompt(spec)},
                    {"role": "assistant", "content": code},
                ],
                "_code_hash": hashlib.md5(normalize_code(code).encode()).hexdigest(),
            }
        )
    return records, skipped


def random_split(records: list[dict], seed: int = SEED, ratio: float = SPLIT_RATIO):
    """Seeded shuffle split (80/20, seed 42)."""
    random.seed(seed)
    shuffled = records.copy()
    random.shuffle(shuffled)
    cut = int(len(shuffled) * ratio)
    return shuffled[:cut], shuffled[cut:]


def clean_eval_ids(train: list[dict], test: list[dict], valid_ids: set[str]) -> list[str]:
    """Held-out modules with no identical-code copy in ``train`` and a testbench in ``valid_ids``."""
    seen = {r["_code_hash"] for r in train}
    return [r["id"] for r in test if r["_code_hash"] not in seen and r["id"] in valid_ids]


def public(record: dict) -> dict:
    return {k: v for k, v in record.items() if not k.startswith("_")}
