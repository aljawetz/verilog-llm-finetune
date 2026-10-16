"""Compile and simulate a Verilog module against a testbench with Icarus Verilog.

This is the single scoring rule used both to validate generated testbenches against
reference solutions and to evaluate model outputs. A run passes only if it compiles,
prints ``PASS``, and prints none of ``Error:`` / ``Failed`` / ``FAIL``.
"""

from __future__ import annotations

import re
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path

# Note: no trailing \b after "Error:" -- a word boundary never occurs between ":" and a space.
FAIL_PATTERNS = re.compile(r"\bError:|\bFailed\b|\bFAIL\b", re.IGNORECASE)
CATEGORIES = ("pass", "compile_error", "timeout", "wrong_output", "no_output")


@dataclass(frozen=True)
class SimResult:
    category: str  # one of CATEGORIES
    message: str = ""

    @property
    def passed(self) -> bool:
        return self.category == "pass"


def classify_output(stdout: str, stderr: str = "") -> SimResult:
    """Classify finished simulation output."""
    if FAIL_PATTERNS.search(stdout) or FAIL_PATTERNS.search(stderr):
        return SimResult("wrong_output", "simulation printed Error/Failed/FAIL")
    if "PASS" not in stdout:
        snippet = (stdout + stderr).strip()[:200] or "(no output)"
        return SimResult("no_output", f"no PASS in output: {snippet}")
    return SimResult("pass")


def run_files(
    module_path: Path,
    tb_path: Path,
    *,
    compile_timeout: int = 15,
    sim_timeout: int = 30,
) -> SimResult:
    """Compile ``module_path`` + ``tb_path`` and simulate."""
    with tempfile.TemporaryDirectory() as tmp:
        sim = Path(tmp) / "sim"
        try:
            c = subprocess.run(
                ["iverilog", "-o", str(sim), str(module_path), str(tb_path)],
                capture_output=True,
                text=True,
                timeout=compile_timeout,
            )
        except FileNotFoundError as e:
            raise RuntimeError("iverilog not found; install icarus-verilog") from e
        except subprocess.TimeoutExpired:
            return SimResult("compile_error", "compile timeout")
        if c.returncode != 0:
            return SimResult("compile_error", (c.stderr or c.stdout).strip()[:300])
        try:
            r = subprocess.run(["vvp", str(sim)], capture_output=True, text=True, timeout=sim_timeout)
        except subprocess.TimeoutExpired:
            return SimResult("timeout", "simulation timeout")
        return classify_output(r.stdout or "", r.stderr or "")


def run_code(module_code: str, testbench: str, **kwargs) -> SimResult:
    """Same as :func:`run_files` but takes source strings."""
    with tempfile.TemporaryDirectory() as tmp:
        m, t = Path(tmp) / "module.v", Path(tmp) / "tb.v"
        m.write_text(module_code, encoding="utf-8")
        t.write_text(testbench, encoding="utf-8")
        return run_files(m, t, **kwargs)
