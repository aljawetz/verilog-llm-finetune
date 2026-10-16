.PHONY: install test lint format data validate

install:
	pip install -e ".[dev,gen]"

test:
	pytest -q

lint:
	ruff check . && ruff format --check src scripts tests

format:
	ruff check --fix . && ruff format src scripts tests

# The next targets need a local copy of VerilogDB in ./VerilogDB (not included in this repo).
data:          ## rebuild train/test data and the evaluation set
	python scripts/build_dataset.py

validate:      ## re-check every generated testbench against its reference solution
	python scripts/validate_testbenches.py
