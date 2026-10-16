from verilog_ft.generation import extract_verilog, strip_markdown_fences


def test_strip_fences():
    assert strip_markdown_fences("```verilog\nmodule a;\nendmodule\n```") == "module a;\nendmodule"
    assert strip_markdown_fences("plain") == "plain"


def test_extract_truncates_after_endmodule():
    text = "module a;\nendmodule\nhere is an explanation"
    assert extract_verilog(text) == "module a;\nendmodule"


def test_extract_prefers_fenced_code():
    text = "Sure!\n```verilog\nmodule a;\nendmodule\n```\nHope that helps"
    assert extract_verilog(text) == "module a;\nendmodule"
