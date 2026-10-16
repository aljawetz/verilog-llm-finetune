"""Integrity checks on the data files committed to the repo."""

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def test_published_split_is_consistent():
    s = json.loads((ROOT / "data/split.json").read_text())
    train, test = set(s["train_ids"]), set(s["test_ids"])
    assert not train & test
    assert (s["train"], s["test"], s["total"]) == (len(train), len(test), len(train) + len(test))
    tests = {p.name.removesuffix("_tb.v") for p in (ROOT / "generated_tests").glob("*_tb.v")}
    assert train | test <= tests, "every split module needs a committed testbench"


def test_clean_subset_is_valid():
    ids = (ROOT / "data/test_ids_dedup.txt").read_text().split()
    s = json.loads((ROOT / "data/split.json").read_text())
    ref = json.loads((ROOT / "results/reference_validation.json").read_text())["per_module"]
    assert len(ids) == len(set(ids)) == 390
    assert set(ids) <= set(s["test_ids"])
    assert all(ref[i] == "pass_clean" for i in ids), "clean subset must have clean testbenches"


def test_clean_subset_results_match_summary():
    r = json.loads((ROOT / "results/clean_subset_results.json").read_text())
    summ = json.loads((ROOT / "results/evaluation_summary.json").read_text())["clean_subset"]
    for model in ("baseline", "finetuned"):
        assert r[model]["passed"] == summ[model]["passed"]
        assert r[model]["total"] == summ[model]["total"] == 390
        assert r[model]["passed"] == sum(v == "pass" for v in r[model]["per_module"].values())
