# Makefile for ThuThesis

# Compiling method: latexmk/xelatex/pdflatex
METHOD = latexmk
# Set opts for latexmk if you use it
LATEXMKOPTS = -xelatex -halt-on-error -interaction=nonstopmode
# Basename of thesis
THESISMAIN = main
# Basename of shuji
SHUJIMAIN = shuji

PACKAGE=thuthesis
SOURCES=$(PACKAGE).ins $(PACKAGE).dtx
THESISCONTENTS=$(THESISMAIN).tex data/*.tex $(FIGURES)
# NOTE: update this to reflect your local file types.
FIGURES=$(wildcard figures/*.eps figures/*.pdf)
BIBFILE=ref/*.bib
BSTFILE=*.bst
SHUJICONTENTS=$(SHUJIMAIN).tex
CLSFILES=dtx-style.sty $(PACKAGE).cls $(PACKAGE).cfg

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
	latex $(PACKAGE).ins

viewdoc: doc
	$(OPEN) $(PACKAGE).pdf

doc: $(PACKAGE).pdf

viewthesis: thesis
	$(OPEN) $(THESISMAIN).pdf

thesis: $(THESISMAIN).pdf

viewshuji: shuji
	$(OPEN) $(SHUJIMAIN).pdf

shuji: $(SHUJIMAIN).pdf

ifeq ($(METHOD),latexmk)

$(PACKAGE).pdf: $(CLSFILES) $(THESISMAIN).tex FORCE_MAKE
	$(METHOD) $(LATEXMKOPTS) $(PACKAGE).dtx

$(THESISMAIN).pdf: $(CLSFILES) $(BSTFILE) FORCE_MAKE
	$(METHOD) $(LATEXMKOPTS) $(THESISMAIN)

$(SHUJIMAIN).pdf: $(CLSFILES) FORCE_MAKE
	$(METHOD) $(LATEXMKOPTS) $(SHUJIMAIN)

else ifneq (,$(filter $(METHOD),xelatex pdflatex))

$(PACKAGE).pdf: $(CLSFILES) $(THESISMAIN).tex
	$(METHOD) $(PACKAGE).dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	$(METHOD) $(PACKAGE).dtx
	$(METHOD) $(PACKAGE).dtx

$(THESISMAIN).pdf: $(CLSFILES) $(THESISCONTENTS) $(THESISMAIN).bbl
	$(METHOD) $(THESISMAIN)
	$(METHOD) $(THESISMAIN)

$(THESISMAIN).bbl: $(BIBFILE) $(BSTFILE)
	$(METHOD) $(THESISMAIN)
	-bibtex $(THESISMAIN)
	$(RM) $(THESISMAIN).pdf

$(SHUJIMAIN).pdf: $(CLSFILES) $(SHUJICONTENTS)
	$(METHOD) $(SHUJIMAIN)

else
$(error Unknown METHOD: $(METHOD))

endif

clean:
	latexmk -c $(PACKAGE).dtx $(THESISMAIN) $(SHUJIMAIN)
	-@$(RM) *~

cleanall: clean
	-@$(RM) $(PACKAGE).pdf $(THESISMAIN).pdf $(SHUJIMAIN).pdf

distclean: cleanall
	-@$(RM) $(CLSFILES)
	-@$(RM) -r dist

check: FORCE_MAKE
	@ag 'Tsinghua University Thesis Template|\\def\\version|"version":' thuthesis.dtx package.json

dist: all
	@if [ -z "$(version)" ]; then \
		echo "Usage: make dist version=[x.y.z | ctan]"; \
	else \
		npm run build -- --version=$(version); \
	fi
