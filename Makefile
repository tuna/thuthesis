# Makefile for ThuThesis

PACKAGE = thuthesis
THESIS  = main
SPINE   = spine

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = dtx-style.sty $(PACKAGE).cls

LATEXMK = latexmk

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

.PHONY: all all-dev clean distclean dist thesis viewthesis spine viewspine doc viewdoc cls check save savepdf test FORCE_MAKE

thesis: $(THESIS).pdf

all: thesis spine

all-dev: doc all

cls: $(CLSFILE)

$(CLSFILE): $(SOURCES)
	xetex $(PACKAGE).ins

doc: $(PACKAGE).pdf

spine: $(SPINE).pdf

$(PACKAGE).pdf: cls FORCE_MAKE
	$(LATEXMK) $(PACKAGE).dtx

$(THESIS).pdf: cls FORCE_MAKE
	$(LATEXMK) $(THESIS)

$(SPINE).pdf: cls FORCE_MAKE
	$(LATEXMK) $(SPINE)

viewdoc: doc
	$(LATEXMK) -pv $(PACKAGE).dtx

viewthesis: thesis
	$(LATEXMK) -pv $(THESIS)

viewspine: spine
	$(LATEXMK) -pv $(SPINE)

save:
	bash testfiles/save.sh

savepdf:
	bash testfiles/save-pdf.sh

test:
	l3build check

clean:
	$(LATEXMK) -c $(PACKAGE).dtx $(THESIS) $(SPINE)
	-@$(RM) *~ main-survey.*

cleanall: clean
	-@$(RM) $(PACKAGE).pdf $(THESIS).pdf $(SPINE).pdf

distclean: cleanall
	-@$(RM) $(CLSFILE)
	-@$(RM) -r dist

check: FORCE_MAKE
ifeq ($(version),)
	@echo "Error: version missing: \"make [check|dist] version=X.Y.Z\""; exit 1
else
	@[[ $(shell grep -E -c '$(version) Tsinghua University Thesis Template|\\def\\version\{$(version)\}' thuthesis.dtx) -eq 3 ]] || (echo "update version in thuthesis.dtx before release"; exit 1)
	@[[ $(shell grep -E -c '"version": "$(version)"' package.json) -eq 1 ]] || (echo "update version in package.json before release"; exit 1)
endif

dist: check all-dev
	npm run build -- --version=$(version)
