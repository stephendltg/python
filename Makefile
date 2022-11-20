# Basic Makefile for python project

VERSION	?= $(shell cat $(PWD)/.version 2> /dev/null || echo v0)
PY_VERSION ?= $(shell python --version)

# Python commands
PYCMD = python
PIP = pip3
PYTEST = pytest
PYLINT = pylint

.PHONY: help deps tools tests all release

default: help

# show this help
help:
	@echo 'usage: make [target] ...'
	@echo ''
	@echo 'targets:'
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

check: ## check
	make lint
	make tests

deps: ## install deps
	@$(PIP) install --user -r requirements.txt

env: ## Env
	@echo $(VERSION) "\n"
	@$(PYCMD) -m pip --version
	@echo $(PY_VERSION) "\n"
	@$(PYCMD) -m pip list

tools: ## tools
	@$(PYCMD) -m pip freeze > requirements.txt

lint: ## linter
	@$(PYLINT) **/*.py

tests:	## tests
	@$(PYTEST)

run: ## run
	@$(PYCMD) hello.py

release: ## release
	git tag $(VERSION)
	git push --tags
