#!/usr/bin/env bash
set -euo pipefail

mkdir -p build

latexmk \
  -xelatex \
  -shell-escape \
  -interaction=nonstopmode \
  -file-line-error \
  -outdir=build \
  main.tex