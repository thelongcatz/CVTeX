.PHONY: all pdf clean
PANDOC_COMMON = --lua-filter=no_tightlist.lua $(patsubst build/%.tex,%.md,$@) -o $@
MARKDOWN_SOURCES := Education Work Research Skills
TEX_INTERMEDIATE := $(patsubst %,build/%.tex,$(MARKDOWN_SOURCES))

all: pdf

clean:
	rm -rf build/*

pdf: $(TEX_INTERMEDIATE)
	cd build; latexmk -lualatex ../CV.tex
build/Skills.tex: Skills.md
	pandoc --lua-filter=metasection.lua $(PANDOC_COMMON)
build/%.tex: %.md
	pandoc --lua-filter=cvevent.lua $(PANDOC_COMMON)
