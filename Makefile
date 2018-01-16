EMACS ?= emacs

compile:
	cask exec $(EMACS) -Q -batch \
	-L ./src/elisp \
	--eval '(setq byte-compile-error-on-warn t)' \
	-f batch-byte-compile ./src/elisp/*.el

test:
	cask exec ert-runner --verbose --win --reporter ert; \
	cask exec ert-runner --verbose --no-win --reporter ert \

clean:
	rm -f ./src/elisp/*.elc

.PHONY: test
