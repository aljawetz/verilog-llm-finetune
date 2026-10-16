import json

from verilog_ft.dataset import build_records, clean_eval_ids, normalize_code, public, random_split


def test_normalize_code_ignores_comments_and_whitespace():
    a = "module a ( input x ); // c\n /* b */ endmodule"
    b = "module a(input x);endmodule"
    assert normalize_code(a) == normalize_code(b)
    assert normalize_code(a) != normalize_code("module b(input x);endmodule")


def _make_db(tmp_path, specs):
    db, tests = tmp_path / "db", tmp_path / "tests"
    db.mkdir()
    tests.mkdir()
    for mid, code in specs.items():
        (db / f"{mid}.json").write_text(
            json.dumps({"module_name": mid, "description": "d", "ports": [], "verilog_code": code})
        )
        (tests / f"{mid}_tb.v").write_text("// tb")
    return db, tests


def test_build_records_skips_missing_and_empty(tmp_path):
    db, tests = _make_db(tmp_path, {"a_1": "module a;endmodule", "b_1": ""})
    (tests / "c_1_tb.v").write_text("// no spec for c")
    records, skipped = build_records(db, tests)
    assert [r["id"] for r in records] == ["a_1"]
    assert sorted(skipped) == ["b_1", "c_1"]
    assert [m["role"] for m in records[0]["messages"]] == ["user", "assistant"]
    assert "_code_hash" not in public(records[0])


def test_random_split_is_deterministic():
    recs = [{"id": f"m_{i}", "messages": [], "_code_hash": f"h{i}"} for i in range(50)]
    train, test = random_split(recs)
    assert len(train) == 40 and len(test) == 10
    assert [r["id"] for r in test] == [r["id"] for r in random_split(recs)[1]]


def test_clean_eval_ids_excludes_duplicates_and_invalid_testbenches():
    train = [{"id": "a_1", "_code_hash": "h1"}]
    test = [
        {"id": "a_2", "_code_hash": "h1"},  # identical code in train
        {"id": "b_1", "_code_hash": "h2"},
        {"id": "c_1", "_code_hash": "h3"},  # testbench fails its reference
    ]
    assert clean_eval_ids(train, test, {"a_1", "a_2", "b_1"}) == ["b_1"]
