## Makefile for "guess_my_number" all language versions

LANGS = lang_c lang_pascal

.PHONY: all
all: $(LANGS)

.PHONY: $(LANGS)
$(LANGS):
	make -C $@

.PHONY: c
c: lang_c
	make -C lang_c run

.PHONY: pascal
pascal: lang_pascal
	make -C lang_pascal run

.PHONY: clean
clean:
	for LANG in $(LANGS); do make -C $$LANG clean; done
