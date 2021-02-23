.PHONY: help Makefile docs tests

# ------------------------------------------------------------------------------------ #
#                                    Initialization                                    #
#																																										   #
#                                         init                                         #
# ------------------------------------------------------------------------------------ #
init:
	@pip install --upgrade pip
	@pip install poetry
	@poetry install
	@pre-commit install
	@pre-commit install -t pre-push
	@pre-commit install -t pre-merge-commit

# ------------------------------------------------------------------------------------ #
#                                         CI/CD                                        #
#																																											 #
#                                         tests                                        #
#                                       ci-tests                                       #
# ------------------------------------------------------------------------------------ #
tests:
	@python -m pytest --cov={{cookiecutter.project_import_name}} --cov-branch --verbose

ci-tests:
	@make tests
