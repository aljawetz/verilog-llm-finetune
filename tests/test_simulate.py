import pytest
from conftest import needs_iverilog

from verilog_ft.simulate import classify_output, run_code

GOOD = "module inv(input a, output y); assign y = ~a; endmodule"
WRONG = "module inv(input a, output y); assign y = a; endmodule"


def tb(check: str, tail: str = '$display("PASS"); $finish;') -> str:
    return f"""
module tb; reg a; wire y;
inv uut(.a(a), .y(y));
initial begin a = 0; #1; {check} {tail} end
endmodule"""


CHECK = 'if (y !== 1\'b1) $display("FAIL: y should be 1");'


def test_classify_output_rules():
    assert classify_output("PASS\n").passed
    assert classify_output("hello").category == "no_output"
    assert classify_output("FAIL: x\nPASS").category == "wrong_output"
    assert classify_output("PASS", "Error: boom").category == "wrong_output"


@needs_iverilog
def test_correct_module_passes():
    assert run_code(GOOD, tb(CHECK)).passed


@needs_iverilog
def test_wrong_module_fails():
    assert run_code(WRONG, tb(CHECK)).category == "wrong_output"


@needs_iverilog
def test_fail_line_before_pass_is_rejected():
    """Generated testbenches print PASS at the end even after FAIL lines; a FAIL line must still fail."""
    result = run_code(WRONG, tb(CHECK))  # prints "FAIL: ..." then "PASS"
    assert not result.passed


@needs_iverilog
def test_compile_error():
    assert run_code("module broken(", tb(CHECK)).category == "compile_error"


@needs_iverilog
def test_missing_pass_is_no_output():
    assert run_code(GOOD, tb("", "$finish;")).category == "no_output"


@needs_iverilog
def test_timeout():
    forever = "module tb; initial forever #1; endmodule"
    assert run_code(GOOD, forever, sim_timeout=1).category == "timeout"


def test_missing_iverilog_is_a_clear_error(monkeypatch):
    import subprocess

    def boom(*a, **k):
        raise FileNotFoundError

    monkeypatch.setattr(subprocess, "run", boom)
    with pytest.raises(RuntimeError, match="iverilog not found"):
        run_code(GOOD, tb(CHECK))
