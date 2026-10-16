"""Prompt builders: the finetuning/eval prompt and the testbench-generation prompt."""

from __future__ import annotations

TESTBENCH_SYSTEM_PROMPT = (
    "You are an expert in Verilog/SystemVerilog. You write correct, self-contained "
    "testbenches that compile and run in standard Verilog simulators (e.g. iverilog). "
    "Your testbench must print PASS if all checks pass, or FAIL: <reason> and stop "
    "immediately on any failure."
)


def build_prompt(spec: dict) -> str:
    """Prompt used for finetuning and evaluation: name + description + ports."""
    module_name = spec.get("module_name", "unknown")
    description = spec.get("description", "").strip()
    port_lines = []
    for p in spec.get("ports", []):
        w = p.get("bit_width", 1)
        width_str = f"[{w - 1}:0] " if isinstance(w, int) and w > 1 else ""
        port_lines.append(f"  {p['direction']} {width_str}{p['name']}")
    port_str = "\n".join(port_lines) if port_lines else "  (no ports listed)"
    return (
        f"Generate a Verilog module named `{module_name}` with the following specification.\n\n"
        f"Description: {description}\n\n"
        f"Ports:\n{port_str}\n\n"
        "Respond with only the complete Verilog module code. "
        "Do not include markdown fences or any explanation."
    )


def _format_ports(ports: list) -> str:
    lines = []
    for p in ports:
        raw_w = p.get("bit_width")
        w = raw_w if isinstance(raw_w, int) and raw_w > 1 else 1
        width = "" if w == 1 else f"[{w - 1}:0] "
        lines.append(f"  {p['direction']} wire {width}{p['name']}")
    return "\n".join(lines) if lines else "  (none)"


def build_testbench_prompt(spec: dict) -> str:
    """Prompt asking an LLM for a testbench.

    Note: it includes the reference implementation, so generated tests can encode
    quirks of that implementation rather than only the written spec.
    """
    name = spec.get("module_name", "unknown")
    code = spec.get("verilog_code", "")
    desc = spec.get("description", "")
    return f"""Generate a Verilog testbench for the following module.

Module name: {name}
Description: {desc}

Ports:
{_format_ports(spec.get("ports", []))}

Module implementation:
```verilog
{code}
```

Requirements:
- Use a single file testbench (no separate includes).
- Drive clock and reset appropriately; use initial blocks and always for clock.
- Instantiate the module under test as uut.
- Include meaningful test sequences that exercise the described behavior.
- If all assertions pass, print exactly: $display("PASS");
- If any assertion fails, print $display("FAIL: <reason>"); and call $finish immediately.
- End the simulation with $finish after the tests run.
- Use `timescale 1ns/1ps.
- Output only the Verilog testbench code, no markdown fences or extra explanation."""
