# Makefile for ThuThesis
# $Id$

ifeq ($(MAKE),)
	override MAKE=make
endif

.PHONY: all clean distclean all thesis shuji doc

all: thesis shuji doc

clean:
	-@rm -f \
		*.aux \
		*.bak \
		*.bbl \
		*.blg \
		*.cls \
		*.cpx \
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
		data/*.aux

distclean: clean
	-@rm -f *.pdf *.bz2

cls:
	$(MAKE) -f thesis.mak cls

thesis:
	$(MAKE) -f thesis.mak

shuji:
	$(MAKE) -f shuji.mak

doc:
	$(MAKE) -f doc.mak
