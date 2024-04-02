#! /usr/bin/env bash

set -e
set -o pipefail
set -u

pandoc \
	-s text_with_citations.md \
	-H header.tex \
	--citeproc \
	--bibliography=refs.bib \
	--csl=../karel-anr-prop-2024.csl \
	-o output.pdf

