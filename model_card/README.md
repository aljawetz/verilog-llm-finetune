---
base_model: meta-llama/Llama-3.2-1B-Instruct
library_name: peft
pipeline_tag: text-generation
license: llama3.2
language:
- en
tags:
- lora
- qlora
- peft
- unsloth
- trl
- sft
- verilog
- hardware
- code-generation
---

# Llama-3.2-1B Verilog (QLoRA adapter)

**Built with Llama.** A LoRA adapter for `meta-llama/Llama-3.2-1B-Instruct` (trained on top of `unsloth/Llama-3.2-1B-Instruct-bnb-4bit`) that generates Verilog modules from a natural-language spec and port list. Code, data pipeline and evaluation: <https://github.com/aljawetz/verilog-llm-finetune>.

## Results

pass@1 on 390 held-out modules (no copy with identical code in the training set; the testbench passes against the reference solution). A module counts if it compiles with Icarus Verilog and passes an LLM-generated testbench; one sample per problem, temperature 0.2, max 1024 new tokens, seed 42:

| Model | pass@1 | 95% CI |
|---|---|---|
| Llama-3.2-1B-Instruct (baseline) | 2.1% (8/390) | 1.0% to 4.0% |
| This adapter | 30.3% (118/390) | 25.9% to 35.0% |

The adapter fixed 113 modules the baseline failed and broke 3 it passed. Per-module outcomes and the notebook to reproduce are in the GitHub repo. The training split is random and the source dataset contains many copies of the same design: 183 of the 390 modules still share a name stem with a training module, so treat 30.3% as an upper bound for entirely unseen designs. Details: [docs/methodology.md](https://github.com/aljawetz/verilog-llm-finetune/blob/main/docs/methodology.md).

## Usage

```python
from unsloth import FastLanguageModel

# Loads the 4-bit base model and applies this adapter (the path used for the evaluation above).
model, tok = FastLanguageModel.from_pretrained(
    "arthurjawetz/llama3.2-1b-verilog-qlora", max_seq_length=2048, load_in_4bit=True)
FastLanguageModel.for_inference(model)

prompt = (
    "Generate a Verilog module named `ACC` with the following specification.\n\n"
    "Description: The module captures an 8-bit input into an internal register on a positive "
    "clock edge when la_ is low, resets to zero when clr_ is low, and outputs the stored value "
    "on two 8-bit output ports.\n\n"
    "Ports:\n  output [7:0] acc_out1\n  output [7:0] acc_out2\n  input [7:0] acc_in\n"
    "  input la_\n  input clk\n  input clr_\n\n"
    "Respond with only the complete Verilog module code. Do not include markdown fences or any explanation."
)
ids = tok.apply_chat_template([{"role": "user", "content": prompt}],
                              add_generation_prompt=True, return_tensors="pt").to("cuda")
out = model.generate(ids, max_new_tokens=1024, do_sample=True, temperature=0.2)
print(tok.decode(out[0][ids.shape[1]:], skip_special_tokens=True))
```

Use the prompt format above (module name, description, ports, then the instruction); the adapter was trained only on this format.

## Training

- Data: 5,876 (spec, Verilog) pairs from VerilogDB (Calzada et al., [arXiv:2507.13369](https://arxiv.org/abs/2507.13369)), the modules with a GPT-4o-mini-generated testbench, from a seeded random 80/20 split. The data is not redistributed here.
- Method: QLoRA, 4-bit NF4 base, LoRA r=16, alpha=16, dropout 0, on q/k/v/o/gate/up/down projections.
- Hyperparameters: 3 epochs, per-device batch 4 x grad accumulation 4 (effective 16), lr 2e-4, cosine schedule, 10% warmup, `adamw_8bit`, max sequence length 2048, seed 42. Unsloth + TRL `SFTTrainer`, one Colab T4.

## Limitations and intended use

- Research / educational artifact. Generated RTL is not verified for synthesis, timing, or safety; do not use it in hardware without independent review and verification.
- The evaluation testbenches were written by an LLM from the spec and the reference implementation, so passing them does not prove correctness.
- Single training run and single evaluation sample per problem; the confidence intervals reflect test-set size only.
- The split is random over modules and the source dataset contains many copies of the same design, so the reported pass@1 overstates generalization to unseen designs.
- Small model: expect frequent errors on anything beyond short, common building blocks (adders, muxes, flip-flops, counters).

## Licenses

This adapter is a derivative of Llama 3.2 and is subject to the [Llama 3.2 Community License](https://www.llama.com/llama3_2/license/) and Acceptable Use Policy. The training data (VerilogDB, downloaded from [deep-chip.org](https://www.deep-chip.org/verilogdb.html)) comes from many upstream authors with their own licenses, which is why no data is included.

## Citation

```bibtex
@misc{jawetz2026verilogft,
  author = {Jawetz, Arthur},
  title  = {Finetuning Llama-3.2-1B for Verilog generation with LLM-generated testbenches},
  year   = {2026},
  url    = {https://github.com/aljawetz/verilog-llm-finetune}
}
```
