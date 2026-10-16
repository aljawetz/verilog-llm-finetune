# Methodology

How the benchmark is built and scored. All checks were run with Icarus Verilog 13.0.

## 1. Benchmark construction

1. **Source.** Each VerilogDB module has a natural-language description, a port list and a reference implementation, but no tests.
2. **Testbench generation.** GPT-4o-mini (temperature 0.2, OpenAI Batch API) writes one testbench per module (`scripts/submit_unit_tests.py`). The prompt contains the spec and the reference implementation, so tests can reflect the implementation's behavior as well as the written spec.
3. **Validation.** Each testbench is run against its module's reference solution under the scoring rule below (`scripts/collect_unit_tests.py`, `scripts/validate_testbenches.py`). `results/reference_validation.json` records the result for all 7,348 testbenches in `generated_tests/`: 6,045 pass cleanly, and only those are used in the evaluation set.
4. **Scoring.** A generated module is compiled with `iverilog` and run with `vvp`. It passes if `PASS` is printed and none of `Error:`, `Failed`, `FAIL` appear (`src/verilog_ft/simulate.py`). Failures are bucketed into compile error, timeout, wrong output and no output.

## 2. Data split and evaluation set

7,345 modules are split 80/20 with a seeded shuffle (seed 42): 5,876 for training and 1,469 held out (`data/split.json`). Each prompt gives the module name, the description and the port list (`src/verilog_ft/prompts.py`).

VerilogDB contains many copies of the same design (`foo_1`, `foo_2`, ...). To measure generalization, the evaluation set (`data/test_ids_dedup.txt`) keeps the held-out modules that

- have no copy in the training set whose code is identical after removing comments and whitespace, and
- have a testbench that passes cleanly against the reference solution.

That leaves 390 modules. 183 of them share a name stem with a training module (for example `foo_2` and `foo_6`), and functionally equivalent rewrites with different code are not detected, so the score is an upper bound on performance for entirely unseen designs.

## 3. Evaluation protocol

One sample per module, temperature 0.2, up to 1,024 new tokens, seed 42, for both the baseline and the finetuned model (`notebooks/eval_clean_subset_colab.ipynb`). Confidence intervals are Wilson 95% intervals; the baseline-versus-finetuned comparison uses a paired sign test on per-module outcomes (`results/clean_subset_results.json`).

`scripts/evaluate_verilog.py` applies the same scoring to any directory of generated modules, without Colab.

## 4. Reproducing

- `make data` rebuilds the train/test files and the evaluation set from a local VerilogDB and reproduces the committed IDs exactly.
- `make validate` regenerates `results/reference_validation.json`.
- The notebooks carry their own copy of the prompt and scoring code so they run standalone in Colab. `src/verilog_ft` is the tested reference implementation of the same logic.

## 5. Not covered

- Variance across seeds or samples, pass@k, and training runs with different splits.
- Comparison with larger models or standard benchmarks such as VerilogEval.
- Testbenches generated from the spec alone.
