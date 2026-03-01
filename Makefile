# Makefile
TEX      = xelatex
MAIN     = tex/main
BUILDDIR = build

.PHONY: all clean watch

all: $(BUILDDIR)/main.pdf

$(BUILDDIR)/main.pdf: tex/main.tex tex/preamble.tex
	mkdir -p $(BUILDDIR)
	$(TEX) -output-directory=$(BUILDDIR) $(MAIN).tex
	$(TEX) -output-directory=$(BUILDDIR) $(MAIN).tex

clean:
	rm -rf $(BUILDDIR)

# Requires: pip install watchdog
watch:
	watchmedo shell-command \
		--patterns="*.tex" \
		--recursive \
		--command='make all 2>&1 | tail -5' .
