.PHONY: help Makefile docs tests

# ------------------------------------------------------------------------------------ #
#                                    Initialization                                    #
#																																										   #
#                                         init                                         #
# ------------------------------------------------------------------------------------ #
init:
	@pip install poetry
	@poetry install
