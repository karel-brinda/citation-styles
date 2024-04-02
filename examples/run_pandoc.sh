#! /usr/bin/env bash

set -e
set -o pipefail
set -u

# more info on how to select a font supporting bracket characters:
#    https://tex.stackexchange.com/a/573217

pandoc \
	-s text_with_citations.md \
	-H header.tex \
	--citeproc \
	--bibliography=refs.bib \
	--csl=../karel-anr-prop-2024.csl \
	-V geometry:a4paper \
	-V geometry:margin=2cm \
	-V mainfont="Latin Modern Math" \
	-V linkcolor:blue \
	-V title:"karel-anr-prop-2024" \
	--pdf-engine=lualatex \
	-o output.pdf

