.PHONY: help Makefile docs tests

SPHINXBUILD   = sphinx-build
SOURCEDIR     = docs
BUILDDIR      = docs/build
GH_PAGES_SOURCES = docs	{{cookiecutter.project_import_name}}	Makefile


# ------------------------------------------------------------------------------------ #
#                                    Initialization                                    #
#																																										   #
#                                         init                                         #
# ------------------------------------------------------------------------------------ #
init:
	@pip install --upgrade pip
	@poetry install
	@pre-commit install
	@pre-commit install -t pre-push
	@pre-commit install -t pre-merge-commit


# ------------------------------------------------------------------------------------ #
#                                     Documentation                                    #
#																																											 #
#                                         docs                                         #
#                                       docs-live                                      #
#                                      docs-tests                                      #
#                                     docs-gh-pages                                    #
# ------------------------------------------------------------------------------------ #
docs:
	@$(SPHINXBUILD) -anE -b html "$(SOURCEDIR)" "$(BUILDDIR)"/html

docs-clean:
	@$(SPHINXBUILD) -M clean "$(SOURCEDIR)" "$(BUILDDIR)"

docs-live:
	@$(MAKE) docs-clean
	@sleep 1 && touch docs/*.rst
	@sphinx-autobuild \
		-q \
		-b html \
		-p 0 \
		--open-browser \
		--delay 5 \
		--ignore "*.pdf" \
		--ignore "*.log" \
		$(SOURCEDIR) \
		$(BUILDDIR)/html

docs-tests:
	@$(SPHINXBUILD) -nEWT -b dummy "$(SOURCEDIR)" "$(BUILDDIR)"

docs-gh-pages:
	@git checkout gh-pages
	@git ls-files -z | xargs -0 rm -f
	@git ls-tree --name-only -d -r -z HEAD | sort -rz | xargs -0 rmdir
	@git checkout master $(GH_PAGES_SOURCES)
	@git checkout master .gitignore
	@git reset HEAD
	@$(MAKE) docs
	@mv -fv $(BUILDDIR)/html/* ./
	@rm -rf $(GH_PAGES_SOURCES) build
	@touch .nojekyll
	@git add -A
	@rm .gitignore
	@git rm .gitignore
	@git commit --no-verify -m "Generated gh-pages for `git log master -1 --pretty=short --abbrev-commit`" && git push $$(git rev-parse --abbrev-ref gh-pages@{upstream} | grep -oP '[^//]*' | head -1) gh-pages; git checkout master


# ------------------------------------------------------------------------------------ #
#                                         CI/CD                                        #
#																																											 #
#                                         tests                                        #
#                                      ci-install                                      #
#                                       ci-script                                      #
# ------------------------------------------------------------------------------------ #


tests:
	@python -m pytest --cov={{cookiecutter.project_import_name}} --cov-branch --verbose

ci-install:
	@$(MAKE) init

ci-script:
	@$(MAKE) tests
	@$(MAKE) docs-tests
