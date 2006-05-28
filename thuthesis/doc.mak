# Makefile for doc
# $Id: $

ifeq ($(TEXI2DVI),)
	override TEXI2DVI=texi2dvi
endif

PACKAGE=thuthesis
MAIN=thuthesis
BIBFILE=ref/refs.bib
SOURCES=$(PACKAGE).ins $(PACKAGE).dtx 

.PHONY: all cls dvi ps pdf

all: pdf

cls: $(PACKAGE).cls

pdf: $(MAIN).pdf

dvi: $(MAIN).dvi

ps: $(MAIN).ps

$(PACKAGE).cls: $(SOURCES)
	rm -f $(PACKAGE).cls $(PACKAGE).cfg
	latex $(PACKAGE).ins

$(MAIN).dvi: $(MAIN).ins $(MAIN).dtx
	latex $(MAIN).dtx
	makeindex -s gind.ist -o $(MAIN).ind $(MAIN).idx
	makeindex -s gglo.ist -o $(MAIN).gls $(MAIN).glo
	latex $(PACKAGE).dtx

$(MAIN).pdf: $(MAIN).ps
	ps2pdf  $(MAIN).ps

$(MAIN).ps: $(MAIN).dvi
	gbk2uni $(MAIN)
	latex $(MAIN).dtx
	dvips -Ppdf -G0 $(MAIN).dvi
