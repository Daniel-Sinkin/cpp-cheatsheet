#!/usr/bin/env bash
set -euo pipefail

SRC="tex/main.tex"
OUTDIR="build"

mkdir -p "$OUTDIR"

latexmk -C -outdir="$OUTDIR" "$SRC" >/dev/null 2>&1 || true

latexmk \
  -pdf \
  -xelatex \
  -interaction=nonstopmode \
  -halt-on-error \
  -file-line-error \
  -synctex=1 \
  -outdir="$OUTDIR" \
  "$SRC"