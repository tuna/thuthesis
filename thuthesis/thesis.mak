# Makefile for main
# $Id: $

ifeq ($(TEXI2DVI),)
	override TEXI2DVI=texi2dvi
endif

ifneq ($(METHOD),ps2pdf)
ifneq ($(METHOD),dvipdfm)
    override METHOD=ps2pdf
endif
endif

PACKAGE=thuthesis
MAIN=main
BIBFILE=ref/refs.bib
SOURCES=$(PACKAGE).ins $(PACKAGE).dtx 

CONTENTS=$(MAIN).tex data/*.tex

.PHONY: all cls dvi ps pdf

all: pdf

cls: $(PACKAGE).cls

pdf: $(MAIN).pdf

dvi: $(MAIN).dvi

ps: $(MAIN).ps

$(PACKAGE).cls: $(SOURCES)
	rm -f $(PACKAGE).cls $(PACKAGE).cfg
	latex $(PACKAGE).ins

$(MAIN).dvi: $(PACKAGE).cls $(PACKAGE).cfg $(CONTENTS) $(MAIN).bbl
	$(TEXI2DVI) $(MAIN).tex

ifeq ($(METHOD),dvipdfm)
$(MAIN).pdf: $(MAIN).dvi
	gbk2uni $(MAIN)
	latex $(MAIN).tex
	dvipdfm $(MAIN).dvi
else
$(MAIN).pdf: $(MAIN).ps
	ps2pdf $(MAIN).ps
endif

$(MAIN).ps: $(MAIN).dvi
	gbk2uni $(MAIN)
	latex $(MAIN).tex
	dvips -Ppdf -G0 $(MAIN).dvi

$(MAIN).bbl: $(BIBFILE)
	$(TEXI2DVI) $(MAIN).tex
	-bibtex $(MAIN)
