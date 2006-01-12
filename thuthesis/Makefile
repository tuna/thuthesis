# Makefile for ThuThesis
# $Id$


PACKAGE=thuthesis
SOURCES=$(PACKAGE).ins $(PACKAGE).dtx 

RE_SOURCES=$(SOURCES) Makefile thutils.sty Readme *.bat
RE_EXTRA=main.tex data ref figures shuji.tex $(PACKAGE).pdf main.pdf shuji.pdf

RE_DIR=thuthesis
RE_DIR_UTILS=$(RE_DIR)/utils

.PHONY: all doc docpdf example dvi ps pdf clean

all: $(SOURCES)
	latex $(PACKAGE).ins

doc: $(SOURCES)
	latex $(PACKAGE).dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	latex $(PACKAGE).dtx
	gbk2uni $(PACKAGE)
	latex $(PACKAGE).dtx

docpdf: doc
	dvips -Ppdf -G0 $(PACKAGE)
	ps2pdf $(PACKAGE).ps

example: pdf shuji

dvi: main.tex data/*.tex
	latex main
	bibtex main
	latex main
	gbk2uni main
	latex main

ps: dvi
	dvips -Ppdf -G0 -ta4 main.dvi

pdf: ps
	ps2pdf -sPAPERSIZE=a4 main.ps

shuji: shuji.tex
	pdflatex $<

clean:
	rm -f *.cls *.cpx *.log *.aux *.ist *.thm \
		  *.glo *.dvi *.pdf *.gls *.idx *.ilg \
		  *.ind *.toc *.bbl *.blg *.out *.bak \
		  *.ps data/*.aux 

cleanexamp:	
	rm -f main.aux main.out main.thm main.toc \
	      main.dvi main.ps main.pdf data/*.aux *.bak

dist:
	mkdir $(RE_DIR)-$(VERSION)
	(cd $(RE_DIR)-$(VERSION) && rm -rf $(RE_SOURCES) $(RE_EXTRA))
	cp -r $(RE_SOURCES) $(RE_EXTRA) $(RE_DIR)-$(VERSION)
	rm -f $(RE_DIR)-$(VERSION).tar.gz
	tar zcf $(RE_DIR)-$(VERSION).tar.gz $(RE_DIR)-$(VERSION)

help:
	@echo -e "\033[1;32mJust Read me, its simple!\n\033[0m"
