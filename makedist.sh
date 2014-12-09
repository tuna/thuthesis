#!/bin/bash

set -e

EXAMPLE_FILES="main.tex shuji.tex main.pdf shuji.pdf"
TEMPLATE_FILES="thuthesis.ins thuthesis.dtx thubib.bst thutils.sty thufonts.def zhfonts.py Makefile README.md thuthesis.pdf "
GEN_FILES="thuthesis.cls thuthesis.cfg"
ALL_FILES="$EXAMPLE_FILES $TEMPLATE_FILES"
ALL_DIRS="data/ figures/ ref/"
DIST_DIR="dist"

if [ $# -lt 1 ]; then
    echo "Usage: ./makedist.sh [version_number | ctan]"
    exit 2
fi

version=$1
version_up=$(echo "$version" | tr '[:lower:]' '[:upper:]')
if [ "$version_up" = "CTAN" ]; then
    dist_build="$DIST_DIR/thuthesis"
    dist_zip="$DIST_DIR/thuthesis.zip"
else
    ALL_FILES+=" $GEN_FILES"
    dist_build="$DIST_DIR/thuthesis-$version"
    dist_zip="$DIST_DIR/thuthesis-$version.zip"
fi

rm -rf $dist_build && mkdir -p $dist_build

echo "Have you cleaned up files in \"$ALL_DIRS\"?"
select yn in "Yes" "No"; do
case $yn in
    Yes ) break;;
    No ) exit;;
esac
done

echo "copy files..."
tar cp $ALL_FILES $ALL_DIRS | tar xp -C $dist_build
if [ "$version_up" = "CTAN" ]; then
    mv $dist_build/README.md $dist_build/README
fi

echo "create tarball...."
rm -f $dist_zip
pushd $DIST_DIR > /dev/null
zip -r -m -q `basename $dist_zip` `basename $dist_build`
popd > /dev/null

echo "$dist_zip is created."
