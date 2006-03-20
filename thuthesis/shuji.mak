# Makefile for shuji
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
MAIN=shuji
SOURCES=$(PACKAGE).ins $(PACKAGE).dtx 

CONTENTS=$(MAIN).tex

.PHONY: all cls dvi ps pdf

all: pdf

cls: $(PACKAGE).cls

pdf: $(MAIN).pdf

dvi: $(MAIN).dvi

ps: $(MAIN).ps

$(PACKAGE).cls: $(SOURCES)
	latex $(PACKAGE).ins

$(MAIN).dvi: $(PACKAGE).cls $(CONTENTS)
	$(TEXI2DVI) $(MAIN).tex

ifeq ($(METHOD),dvipdfm)
$(MAIN).pdf: $(MAIN).dvi
	gbk2uni $(MAIN)
	latex $(MAIN).tex
	dvipdfm $(MAIN).dvi
else
$(MAIN).pdf: $(MAIN).ps
	ps2pdf -sPAPERSIZE=a4 $(MAIN).ps
endif

$(MAIN).ps: $(MAIN).dvi
	gbk2uni $(MAIN)
	latex $(MAIN).tex
	dvips -Ppdf -G0 -ta4 $(MAIN).dvi
