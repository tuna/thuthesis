#!/bin/bash
set -e

export PATH="/opt/texlive/bin/x86_64-linux:$PATH";

XETEX_PKGS="fontname fontspec l3packages xetex";
CTEX_PKGS="cjk ctex environ everysel trimspaces ulem xecjk zhnumber";
HYPERREF_PKGS="bitset letltxmacro pdfescape pdflscape";
BIBLATEX_PKGS="biber biblatex biblatex-apa biblatex-gb7714-2015 biblatex-mla xstring";
NOMENCL_PKGS="nomencl koma-script xkeyval";

BIN_PKGS="latexmk l3build";
REQUIRED_PKGS="$XETEX_PKGS $CTEX_PKGS bibunits caption enumitem etoolbox \
    filehook footmisc notoccite pdfpages soul titlesec threeparttable unicode-math";
FONT_PKGS="fandol tex-gyre xits";
EXTRA_PKGS="algorithms apacite booktabs $HYPERREF_PKGS $BIBLATEX_PKGS $NOMENCL_PKGS ntheorem siunitx";
MARKDOWN_PKGS="markdown fancyvrb csvsimple gobble"
DOC_PKGS="hologo listings xcolor $MARKDOWN_PKGS";
EXAMPLE_PKGS="float fp metalogo multirow mwe"

tlmgr install $BIN_PKGS $REQUIRED_PKGS $FONT_PKGS $EXTRA_PKGS $DOC_PKGS \
    $EXAMPLE_PKGS;
