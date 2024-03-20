#!/bin/bash
set -e

# download installer
CTAN_MIRROR="https://ctan.math.illinois.edu"
TL_REMOTE="${CTAN_MIRROR}/systems/texlive/tlnet";
INSTALL="/tmp/install-texlive";

# install TeX Live & remove installer
mkdir -p "$INSTALL";
curl -sSL "${TL_REMOTE}/install-tl-unx.tar.gz" | tar -xz -C "$INSTALL" \
    --strip-components=1;
"$INSTALL/install-tl" -no-gui -repository ${TL_REMOTE} \
    -profile /tmp/texlive.profile;
rm -rf "$INSTALL";

# add packages with tlmgr
export PATH="/opt/texlive/bin/x86_64-linux:$PATH";
tlmgr option repository ${TL_REMOTE}
