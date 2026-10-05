## Makefile for "guess_my_number" all language versions

LANGS   = lang_c lang_pascal
SELECT ?= $(shell bash -c 'echo -e \
		"Game variants (language implementation): \n \
		\t 1 - C           \n \
		\t 2 - Free Pascal \n \
		" >&2; \
		read -p "> Select game variant: " select; \
		if   [ "$$select" = "1" ]; then echo "c"; \
		elif [ "$$select" = "2" ]; then echo "pascal"; \
		else echo "error"; \
		fi ')

.PHONY: all
all:
	make $(SELECT)

.PHONY: c
c: lang_c
	make -C lang_c

.PHONY: pascal
pascal: lang_pascal
	make -C lang_pascal

.PHONY: error
error:
	exit

.PHONY: clean
clean:
	for LANG in $(LANGS); do make -C $$LANG clean; done
