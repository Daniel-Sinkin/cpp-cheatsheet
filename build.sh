#!/usr/bin/env bash
set -euo pipefail

mkdir -p build

latexmk -C -outdir=build tex/main.tex >/dev/null 2>&1 || true

latexmk \
  -pdf \
  -xelatex \
  -shell-escape \
  -interaction=nonstopmode \
  -file-line-error \
  -synctex=1 \
  -outdir=build \
  tex/main.tex