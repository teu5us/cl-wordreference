LISP ?= ros run --
WORDREF ?= $(HOME)/.local/bin/wordref

.PHONY: all

all: install

install:
	@$(LISP) --eval "(asdf:load-system :cl-wordreference)" \
		--eval "(declaim (optimize (speed 3) (debug 0) (safety 0) (space 0) (compilation-speed 0)))" \
		--eval "(let ((uiop:*image-dump-hook* (cons (lambda () (asdf:clear-system :cl-wordreference)) uiop:*image-dump-hook*))) (asdf:oos 'asdf:program-op :cl-wordreference))"

uninstall:
	@rm $(WORDREF)
