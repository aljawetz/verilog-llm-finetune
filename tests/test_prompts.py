from verilog_ft.prompts import build_prompt, build_testbench_prompt

SPEC = {
    "module_name": "ACC",
    "description": " Stores a value. ",
    "ports": [
        {"name": "q", "direction": "output", "bit_width": 8},
        {"name": "clk", "direction": "input", "bit_width": 1},
    ],
    "verilog_code": "module ACC(output [7:0] q, input clk); endmodule",
}


def test_build_prompt_format():
    p = build_prompt(SPEC)
    assert p.startswith("Generate a Verilog module named `ACC`")
    assert "Description: Stores a value.\n" in p  # description is stripped
    assert "  output [7:0] q\n  input clk\n" in p  # width only when > 1
    assert p.endswith("Do not include markdown fences or any explanation.")


def test_build_prompt_without_ports():
    assert "(no ports listed)" in build_prompt({"module_name": "x", "ports": []})


def test_testbench_prompt_embeds_reference_and_contract():
    p = build_testbench_prompt(SPEC)
    assert SPEC["verilog_code"] in p
    assert 'print exactly: $display("PASS");' in p
    assert "  output wire [7:0] q" in p
