.PHONY: all help clean cleanall view ../examples.png

SHELL=/usr/bin/env bash -eo pipefail

.SECONDARY:

.SUFFIXES:


BASENAMES=$(basename $(notdir $(wildcard ../*.csl)))

##############
## Commands ##
##############

all: ../examples.png

../examples.png: $(addsuffix .png,$(BASENAMES))
	convert -append $^ -bordercolor White -border 20x20 $@


	#./run_pandoc.sh

%.png: %.pdf
	convert \
		-density 300 $< \
		-background white \
		-flatten \
		-trim +repage \
		-quality 100 \
		$@

%.pdf: %.tex
	#-pdflatex=lualatex
	latexmk -pdf $<

%.tex:../%.csl template.tex refs.bib
	pandoc \
	    template.tex \
		-s \
		--citeproc \
		--bibliography=refs.bib \
		--csl=$< \
		-H header.tex \
		-V geometry:a4paper \
		-V geometry:margin=2cm \
		-V linkcolor:blue \
		-V title:"Style: $*.csl" \
		-t latex \
		-o $@

help: ## Print help messages
	@echo -e "$$(grep -hE '^\S*(:.*)?##' $(MAKEFILE_LIST) \
		| sed \
		-e 's/:.*##\s*/:/' \
		-e 's/^\(.*\):\(.*\)/   \\x1b[36m\1\\x1b[m:\2/' \
		-e 's/^\([^#]\)/\1/g' \
		-e 's/: /:/g' \
		-e 's/^#\(.*\)#/\\x1b[90m\1\\x1b[m/' \
		| column -c2 -t -s : )"

clean: ## Clean
	rm -fv ../*.png

cleanall: clean ## Clean all

view: ## View output
	open output.pdf
