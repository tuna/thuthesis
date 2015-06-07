# Makefile for ThuThesis

# Compiling method: latexmk/xelatex/pdflatex/dvipdfmx
METHOD = latexmk
# Set opts for latexmk if you use it
LATEXMKOPTS = -xelatex
# Basename of thesis
THESISMAIN = main
# Basename of shuji
SHUJIMAIN = shuji

ifeq ($(MAKE),)
	override MAKE = make
endif

ifeq ($(TEXI2DVI),)
	override TEXI2DVI = texi2dvi
endif

PACKAGE=thuthesis
SOURCES=$(PACKAGE).ins $(PACKAGE).dtx
THESISCONTENTS=$(THESISMAIN).tex data/*.tex $(EPS)
# NOTE: update this to reflect your local file types.
EPS=$(wildcard figures/*.eps)
BIBFILE=ref/*.bib
SHUJICONTENTS=$(SHUJIMAIN).tex
CLSFILES=dtx-style.sty $(PACKAGE).cls $(PACKAGE).cfg

# make deletion work on Windows
ifdef SystemRoot
   RM = del /Q
   SLASH = \\
else
   RM = rm -f
   SLASH = /
endif

.PHONY: all clean distclean dist thesis shuji doc cls FORCE_MAKE

all: doc thesis shuji

###### generate cls/cfg
cls: $(CLSFILES)

$(CLSFILES): $(SOURCES)
	latex $(PACKAGE).ins

###### for doc

doc: $(PACKAGE).pdf

ifeq ($(METHOD),xelatex)

$(PACKAGE).pdf: $(CLSFILES)
	xelatex $(PACKAGE).dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	xelatex $(PACKAGE).dtx
	xelatex $(PACKAGE).dtx

else ifeq ($(METHOD),pdflatex)

$(PACKAGE).pdf: $(CLSFILES)
	pdflatex $(PACKAGE).dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	pdflatex $(PACKAGE).dtx
	pdflatex $(PACKAGE).dtx

else ifeq ($(METHOD),latexmk)

$(PACKAGE).pdf: $(CLSFILES) FORCE_MAKE
	latexmk $(LATEXMKOPTS) $(PACKAGE).dtx

else

$(PACKAGE).dvi: $(CLSFILES)
	latex $(PACKAGE).dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	latex $(PACKAGE).dtx
	latex $(PACKAGE).dtx

$(PACKAGE).pdf: $(PACKAGE).dvi
	latex $(PACKAGE).dtx
	dvipdfmx  $(PACKAGE).dvi

endif

###### for thesis

thesis: $(THESISMAIN).pdf

ifeq ($(METHOD),xelatex)

$(THESISMAIN).pdf: $(CLSFILES) $(THESISCONTENTS) $(THESISMAIN).bbl
	xelatex $(THESISMAIN).tex
	xelatex $(THESISMAIN).tex

$(THESISMAIN).bbl: $(BIBFILE)
	xelatex $(THESISMAIN).tex
	-bibtex $(THESISMAIN)
	$(RM) $(THESISMAIN).pdf

else ifeq ($(METHOD),pdflatex)

$(THESISMAIN).pdf: $(CLSFILES) $(THESISCONTENTS) $(THESISMAIN).bbl
	pdflatex $(THESISMAIN).tex
	pdflatex $(THESISMAIN).tex

$(THESISMAIN).bbl: $(BIBFILE)
	pdflatex $(THESISMAIN).tex
	-bibtex $(THESISMAIN)
	$(RM) $(THESISMAIN).pdf

else ifeq ($(METHOD),latexmk)

$(THESISMAIN).pdf: $(CLSFILES) FORCE_MAKE
	latexmk $(LATEXMKOPTS) $(THESISMAIN)

else

$(THESISMAIN).pdf: $(THESISMAIN).dvi
	latex $(THESISMAIN).tex
	dvipdfmx $(THESISMAIN).dvi

$(THESISMAIN).dvi: $(CLSFILES) $(THESISCONTENTS) $(THESISMAIN).bbl
	$(TEXI2DVI) $(THESISMAIN).tex

$(THESISMAIN).bbl: $(BIBFILE)
	$(TEXI2DVI) $(THESISMAIN).tex
	-bibtex $(THESISMAIN)

endif


###### for shuji
shuji: $(SHUJIMAIN).pdf

ifeq ($(METHOD),xelatex)

$(SHUJIMAIN).pdf: $(CLSFILES) $(SHUJICONTENTS)
	xelatex $(SHUJIMAIN).tex

else ifeq ($(METHOD),pdflatex)

$(SHUJIMAIN).pdf: $(CLSFILES) $(SHUJICONTENTS)
	pdflatex $(SHUJIMAIN).tex

else ifeq ($(METHOD),latexmk)

$(SHUJIMAIN).pdf: $(CLSFILES) FORCE_MAKE
	latexmk $(LATEXMKOPTS) $(SHUJIMAIN)

else

$(SHUJIMAIN).dvi: $(CLSFILES) $(SHUJICONTENTS)
	$(TEXI2DVI) $(SHUJIMAIN).tex

$(SHUJIMAIN).pdf: $(SHUJIMAIN).dvi
	latex $(SHUJIMAIN).tex
	dvipdfmx $(SHUJIMAIN).dvi

endif

clean:
	latexmk -c $(PACKAGE).dtx $(THESISMAIN) $(SHUJIMAIN)
	-@$(RM) $(PACKAGE).dvi $(THESISMAIN).dvi $(SHUJIMAIN).dvi
	-@$(RM) *~

cleanall: clean
	-@$(RM) $(PACKAGE).pdf $(THESISMAIN).pdf $(SHUJIMAIN).pdf

distclean: cleanall
	-@$(RM) $(CLSFILES)
	-@$(RM) -r dist

dist:
	@if [ -z "$(VERSION)" ]; then \
		echo "Usage: make dist VERSION=<version#>"; \
	else \
		./makedist.sh $(VERSION); \
	fi
