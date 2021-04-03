#!/bin/bash
set -e

# download installer
REMOTE="http://mirror.ctan.org/systems/texlive/tlnet";
INSTALL="/tmp/install-texlive";

# install TeX Live & remove installer
mkdir -p "$INSTALL";
curl -sSL "$REMOTE/install-tl-unx.tar.gz" | tar -xz -C "$INSTALL" \
    --strip-components=1;
"$INSTALL/install-tl" -no-gui -repository $REMOTE \
    -profile /tmp/texlive.profile;
rm -rf "$INSTALL";

# add packages with tlmgr
export PATH="/opt/texlive/bin/x86_64-linux:$PATH";
