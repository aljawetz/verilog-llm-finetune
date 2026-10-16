"""Post-processing of raw model output."""

from __future__ import annotations

import re


def strip_markdown_fences(text: str) -> str:
    """Remove a wrapping ```...``` fence from a whole response."""
    t = (text or "").strip()
    if not t.startswith("```"):
        return t
    lines = t.split("\n")[1:]
    if lines and lines[-1].strip() == "```":
        lines = lines[:-1]
    return "\n".join(lines).strip()


def extract_verilog(text: str) -> str:
    """Keep fenced code if present and truncate after the first ``endmodule`` line."""
    if "```" in text:
        out, inside = [], False
        for line in text.split("\n"):
            if line.strip().startswith("```"):
                inside = not inside
                continue
            if inside:
                out.append(line)
        text = "\n".join(out)
    m = re.search(r"\bendmodule\b", text, re.IGNORECASE)
    if m:
        end = text.find("\n", m.end())
        text = text[: end if end != -1 else m.end()]
    return text.strip()
