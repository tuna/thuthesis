# Makefile for ThuThesis

# Set opts for latexmk if you use it
LATEXMKOPTS = -xelatex -file-line-error -halt-on-error -interaction=nonstopmode
# Basename of thesis
THESISMAIN = main
# Basename of shuji
SHUJIMAIN = shuji

PACKAGE=thuthesis
SOURCES=$(PACKAGE).ins $(PACKAGE).dtx
THESISCONTENTS=$(THESISMAIN).tex data/*.tex $(FIGURES)
# NOTE: update this to reflect your local file types.
FIGURES=$(wildcard figures/*.pdf)
BIBFILE=ref/*.bib
BSTFILE=*.bst
SHUJICONTENTS=$(SHUJIMAIN).tex
CLSFILES=dtx-style.sty $(PACKAGE).cls

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
	OPEN = start
else
	RM = rm -f
	OPEN = open
endif

.PHONY: all clean distclean dist thesis viewthesis shuji viewshuji doc viewdoc cls check FORCE_MAKE

all: doc thesis shuji

cls: $(CLSFILES)

$(CLSFILES): $(SOURCES)
	xetex $(PACKAGE).ins

viewdoc: doc
	$(OPEN) $(PACKAGE).pdf

doc: $(PACKAGE).pdf

viewthesis: thesis
	$(OPEN) $(THESISMAIN).pdf

thesis: $(THESISMAIN).pdf

viewshuji: shuji
	$(OPEN) $(SHUJIMAIN).pdf

shuji: $(SHUJIMAIN).pdf

$(PACKAGE).pdf: $(CLSFILES) $(THESISMAIN).tex FORCE_MAKE
	latexmk $(LATEXMKOPTS) $(PACKAGE).dtx

$(THESISMAIN).pdf: $(CLSFILES) $(BSTFILE) FORCE_MAKE
	latexmk $(LATEXMKOPTS) $(THESISMAIN)

$(SHUJIMAIN).pdf: $(CLSFILES) FORCE_MAKE
	latexmk $(LATEXMKOPTS) $(SHUJIMAIN)

clean:
	latexmk -c $(PACKAGE).dtx $(THESISMAIN) $(SHUJIMAIN)
	-@$(RM) *~

cleanall: clean
	-@$(RM) $(PACKAGE).pdf $(THESISMAIN).pdf $(SHUJIMAIN).pdf

distclean: cleanall
	-@$(RM) $(CLSFILES)
	-@$(RM) -r dist

check: FORCE_MAKE
	@[[ $(shell grep -E -c 'Tsinghua University Thesis Template|\\def\\version' thuthesis.dtx) -eq 3 ]] || (echo "update version in thuthesis.dtx before release"; exit 1)
	@[[ $(shell grep -E -c '"version":' package.json) -eq 1 ]] || (echo "update version in package.json before release"; exit 1)

dist: check all
	@if [ -z "$(version)" ]; then \
		echo "Usage: make dist version=[x.y.z | ctan]"; \
	else \
		npm run build -- --version=$(version); \
	fi
