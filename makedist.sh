#!/bin/sh

EXAMPLE_FILES="main.tex shuji.tex main.pdf shuji.pdf"
TEMPLATE_FILES="thuthesis.ins thuthesis.dtx thubib.bst thutils.sty fontname.def zhfonts.py Makefile README.md thuthesis.pdf "
GEN_FILES="thuthesis.cls thuthesis.cfg"
ALL_FILES="$EXAMPLE_FILES $TEMPLATE_FILES $GEN_FILES"
ALL_DIRS="data/ figures/ ref/"
DIST_DIR="dist/"

if [ $# -lt 1 ]; then
    echo "Usage: ./makedist.sh version_number"
    exit 2
fi

version=$1
dist_build="$DIST_DIR/thuthesis-$version"
dist_zip="$DIST_DIR/thuthesis-$version.zip"

if [ -d $dist_build ]
then
  echo "clean old dist files..."
  rm -rf $dist_build
fi
mkdir -p $dist_build

echo "Have you cleaned up files in \"$ALL_DIRS\"?"
select yn in "Yes" "No"; do
case $yn in
    Yes ) break;;
    No ) exit;;
esac
done

echo "copy files..."
tar cp $ALL_FILES $ALL_DIRS | tar xp -C $dist_build

echo "create tarball...."
rm -f $dist_zip
pushd $DIST_DIR > /dev/null
zip -r -m -q `basename $dist_zip` `basename $dist_build`
popd > /dev/null

echo "$dist_zip is created."
