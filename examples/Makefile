.PHONY: all help clean cleanall view

SHELL=/usr/bin/env bash -eo pipefail

.SECONDARY:

.SUFFIXES:

##############
## Commands ##
##############

all: ../karel-anr-prop-2024.png
	#./run_pandoc.sh

../%.png: %.pdf
	convert \
		-density 300 %< \
		-background white \
		-flatten \
		-trim +repage \
		-quality 100 \
		$@

%.pdf: %.tex
	latexmk -pdflatex=lualatex -pdf $<

%.tex:../%.csl
	pandoc \
	    template.tex \
	    -s \
	    --citeproc \
	    --bibliography=refs.bib \
		--pdf-engine=lualatex \
	    --csl=$< \
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

cleanall: clean ## Clean all

view: ## View output
	open output.pdf
