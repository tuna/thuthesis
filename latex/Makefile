# Makefile for ThuThesis
# $Id$

ifeq ($(MAKE),)
	override MAKE=make
endif

ifeq ($(TEXI2DVI),)
	override TEXI2DVI=texi2dvi
endif

ifneq ($(METHOD),ps2pdf)
ifneq ($(METHOD),dvipdfm)
    override METHOD=ps2pdf
endif
endif

PACKAGE=thuthesis
SOURCES=$(PACKAGE).ins $(PACKAGE).dtx 
THESISMAIN=main
THESISCONTENTS=$(THESISMAIN).tex data/*.tex
BIBFILE=ref/refs.bib
SHUJIMAIN=shuji
SHUJICONTENTS=$(SHUJIMAIN).tex

.PHONY: all clean distclean dist all thesis shuji doc cls cfg dvi ps pdf gbk

all: cls doc thesis shuji


###### generate cls/cfg
cls:  $(SOURCES)
	latex $(PACKAGE).ins

###### for doc

doc: doc-pdf

doc-pdf: $(PACKAGE).pdf

doc-ps: $(PACKAGE).ps

doc-dvi: $(PACKAGE).dvi

$(PACKAGE).dvi: cls
	latex $(PACKAGE).dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	latex $(PACKAGE).dtx
	latex $(PACKAGE).dtx

$(PACKAGE).ps: $(PACKAGE).dvi
	# gbk2uni $(PACKAGE)
	latex $(PACKAGE).dtx
	dvips -Ppdf -G0 -t letter $(PACKAGE).dvi

$(PACKAGE).pdf: $(PACKAGE).ps
	ps2pdf  $(PACKAGE).ps

###### for thesis

thesis: thesis-pdf

thesis-pdf: $(THESISMAIN).pdf

thesis-dvi: $(THESISMAIN).dvi

thesis-ps: $(THESISMAIN).ps

$(THESISMAIN).dvi: cls $(THESISCONTENTS) $(THESISMAIN).bbl
	$(TEXI2DVI) $(THESISMAIN).tex

ifeq ($(METHOD),dvipdfm)
$(THESISMAIN).pdf: $(THESISMAIN).dvi
	# gbk2uni $(THESISMAIN)
	latex $(THESISMAIN).tex
	dvipdfm $(THESISMAIN).dvi
else
$(THESISMAIN).pdf: $(THESISMAIN).ps
	ps2pdf $(THESISMAIN).ps
endif

$(THESISMAIN).ps: $(THESISMAIN).dvi
	# gbk2uni $(THESISMAIN)
	latex $(THESISMAIN).tex
	dvips -Ppdf -G0 $(THESISMAIN).dvi

$(THESISMAIN).bbl: $(BIBFILE)
	$(TEXI2DVI) $(THESISMAIN).tex
	-bibtex $(THESISMAIN)



###### for shuji
shuji: shuji-pdf

shuji-pdf: $(SHUJIMAIN).pdf

shuji-dvi: $(SHUJIMAIN).dvi

shuji-ps: $(SHUJIMAIN).ps

$(SHUJIMAIN).dvi: cls $(SHUJICONTENTS)
	$(TEXI2DVI) $(SHUJIMAIN).tex

ifeq ($(METHOD),dvipdfm)
$(SHUJIMAIN).pdf: $(SHUJIMAIN).dvi
	# gbk2uni $(SHUJIMAIN)
	latex $(SHUJIMAIN).tex
	dvipdfmx $(SHUJIMAIN).dvi
elifeq ($(METHOD),ps2pdf)
$(SHUJIMAIN).pdf: $(SHUJIMAIN).ps
	ps2pdf  $(SHUJIMAIN).ps
else
$(SHUJIMAIN).pdf: cls $(SHUJICONTENTS)
	pdflatex $(SHUJIMAIN)
endif

$(SHUJIMAIN).ps: $(SHUJIMAIN).dvi
	# gbk2uni $(SHUJIMAIN)
	latex $(SHUJIMAIN).tex
	dvips -Ppdf -G0 $(SHUJIMAIN).dvi 

clean: 
	-@rm -f \
		*.aux \
		*.bak \
		*.bbl \
		*.blg \
		*.dvi \
		*.glo \
		*.gls \
		*.idx \
		*.ilg \
		*.ind \
		*.ist \
		*.log \
		*.out \
		*.ps \
		*.thm \
		*.toc \
		*.lof \
		*.lot \
		*.loe \
		data/*.aux \
		dtx-style.sty

distclean: clean
	-@rm -f *.cls *.cfg
	-@rm -f *.pdf *.tar.gz

gbk:
	@./makegbk.sh

dist:
	@if [ -z "$(VERSION)" ]; then \
	    echo "Usage: make dist VERSION=<version#>"; \
	else \
	    if [ ! -d "gbk" ]; then \
 	      echo -e "\n run ./makegbk.sh first to prepare for GBK version.\n"; \
 	    else \
	      ./makedist.sh $(VERSION) UTF8; \
	      (cd gbk ; ../makedist.sh $(VERSION) GBK); \
	    fi; \
	fi
