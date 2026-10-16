# Finetuning a small LLM to write Verilog, scored with LLM-generated testbenches

[![ci](https://github.com/aljawetz/verilog-llm-finetune/actions/workflows/ci.yml/badge.svg)](https://github.com/aljawetz/verilog-llm-finetune/actions/workflows/ci.yml)
[![license: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Can a 1B-parameter model learn to write functionally correct hardware (Verilog) from a natural-language spec? Correctness here is *executable*: every module is compiled and simulated against a testbench. This repo contains the testbench-generation pipeline, a QLoRA finetune of `Llama-3.2-1B-Instruct`, and a simulation-based evaluation. The limits of the benchmark are listed under [Limitations](#limitations).

## Result

pass@1 on 390 held-out modules: one sample per problem, temperature 0.2, seed 42. A module passes if it compiles with Icarus Verilog and passes its testbench.

| | pass@1 | 95% CI |
|---|---|---|
| Baseline `Llama-3.2-1B-Instruct` | 2.1% (8 / 390) | 1.0% to 4.0% |
| + QLoRA finetune on 5,876 modules | 30.3% (118 / 390) | 25.9% to 35.0% |

Finetuning fixed 113 modules the baseline failed and broke 3 it passed (paired sign test, p < 1e-29). Per-module outcomes are in [`results/clean_subset_results.json`](results/clean_subset_results.json); reproduce with [`notebooks/eval_clean_subset_colab.ipynb`](notebooks/eval_clean_subset_colab.ipynb).

The evaluation set ([`data/test_ids_dedup.txt`](data/test_ids_dedup.txt)) holds the held-out modules that have no identical-code copy in the training set and whose testbench passes against the reference solution. Details in [`docs/methodology.md`](docs/methodology.md).

Finetuning clearly helps on this benchmark, but 30.3% is still optimistic for entirely unseen designs, because near-duplicates remain (see [Limitations](#limitations)).

## Pipeline

```
VerilogDB specs ─► (1) testbench generation  GPT-4o-mini via the OpenAI Batch API
                       └─ check each testbench against the reference solution
                   (2) train/test split      seeded random 80/20 over modules
                   (3) QLoRA finetune        Llama-3.2-1B-Instruct, Unsloth + TRL (Colab T4)
                   (4) evaluate              generate -> iverilog/vvp -> pass@1
```

- Testbenches (`scripts/submit_unit_tests.py`, `scripts/collect_unit_tests.py`): about $17.63 in API cost for the full set. Validation uses the same scoring rule as evaluation (`src/verilog_ft/simulate.py`).
- Finetune (`notebooks/finetune_qlora_colab.ipynb`): 4-bit NF4 base, LoRA r=16 / alpha=16 on all attention and MLP projections, 3 epochs, effective batch 16, lr 2e-4 (cosine, 10% warmup), max sequence length 2048.
- Evaluate (`scripts/evaluate_verilog.py`): a run passes only if it compiles, prints `PASS`, and prints none of `Error:`, `Failed`, `FAIL`. Failures are bucketed into compile error, timeout, wrong output, no output.

## Quickstart

```bash
git clone https://github.com/aljawetz/verilog-llm-finetune && cd verilog-llm-finetune
python -m venv venv && source venv/bin/activate
pip install -e ".[dev,gen]"
brew install icarus-verilog        # or: sudo apt-get install iverilog
make test                          # unit tests + lint
```

Score a directory of generated modules (`<module_id>.v`) against the committed testbenches (no VerilogDB needed):

```bash
python scripts/evaluate_verilog.py generated/my_model --ids data/test_ids_dedup.txt --out results/my_model.json
```

Rebuild train/test data (needs your own VerilogDB, see below):

```bash
make data              # train/test files and the evaluation set
make validate          # re-check every testbench against its reference solution
```

## Data

VerilogDB is not included in this repo. The specs and reference solutions come from:

> Calzada et al., *VerilogDB: The Largest, Highest-Quality Dataset with a Preprocessing Framework for LLM-based RTL Generation*, arXiv:[2507.13369](https://arxiv.org/abs/2507.13369), 2025.

I downloaded the dataset from [deep-chip.org/verilogdb.html](https://www.deep-chip.org/verilogdb.html). It is not redistributed here: the modules originate from many GitHub and OpenCores authors with their own licenses. The repo publishes only what I produced: the testbenches (`generated_tests/`), module-ID splits (`data/`), code and results. To rebuild the training data, download the dataset and place it at `VerilogDB/<module_id>.json`.

Splits shipped as IDs only:

- `data/split.json`: random 80/20 split (seed 42) that the adapter was trained on.
- `data/test_ids_dedup.txt`: the 390-module evaluation set.

## Model

LoRA adapter: [`arthurjawetz/llama3.2-1b-verilog-qlora`](https://huggingface.co/arthurjawetz/llama3.2-1b-verilog-qlora). It is a derivative of Llama 3.2 under the [Llama 3.2 Community License](https://www.llama.com/llama3_2/license/). **Built with Llama.** It was trained on the 5,876 training modules in `data/split.json`.

## Limitations

- Duplicates in the data. VerilogDB has many copies of the same design and the split is random, so the adapter has seen near-copies of many held-out designs. The evaluation set removes identical code, but 183 of its 390 modules still share a name stem with a training module, and functionally equivalent rewrites are not detected.
- Testbenches are LLM-written. They were generated from the spec and the reference implementation, so they can encode that implementation's quirks, and passing one does not prove correctness.
- Single run. One sample, one seed, one training run. Intervals reflect test-set size only.
- Scope. A 1B model, one dataset, one benchmark of my own construction; no comparison with larger models or standard benchmarks such as VerilogEval.

## Repository layout

```
src/verilog_ft/     prompts, simulation-based scoring, dataset and split logic
scripts/            build_dataset, validate_testbenches, evaluate_verilog, submit/collect_unit_tests
notebooks/          Colab: QLoRA finetune and evaluation
tests/              pytest suite (needs iverilog for the simulation tests); runs in CI
generated_tests/    LLM-generated testbenches
data/               split and evaluation-set IDs (no VerilogDB content)
results/            evaluation results, testbench-vs-reference validation
docs/               methodology and findings
```

The notebooks are self-contained for Colab and carry their own copy of the prompt and scoring code; `src/verilog_ft` is the tested reference implementation of the same logic.

## Citation and license

See [`CITATION.cff`](CITATION.cff); please also cite VerilogDB. Code: [MIT](LICENSE). This does not cover VerilogDB content or the Llama weights, which have their own terms.
