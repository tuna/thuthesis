REMOTE="https://mirrors.rit.edu/CTAN/systems/texlive/tlnet";
INSTALL="/tmp/install-texlive";

mkdir -p "$INSTALL";
curl -sSL "$REMOTE/install-tl-unx.tar.gz" | tar -xz -C "$INSTALL" \
    --strip-components=1;
"$INSTALL/install-tl" -profile .github/workflows/texlive.profile;

export PATH="/tmp/texlive/bin/x86_64-linux:$PATH";

tlmgr install latexmk l3build \
    fontname fontspec l3packages xetex \
    cjk ctex environ ms trimspaces ulem xecjk zhnumber \
    fandol tex-gyre xits \
    bibunits caption enumitem etoolbox footmisc notoccite pdfpages unicode-math \
    booktabs koma-script nomencl ntheorem siunitx xkeyval \
    bitset letltxmacro pdfescape pdflscape \
    hologo listings xcolor \
    diagbox float fp metalogo multirow pict2e
