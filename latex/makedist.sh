#!/bin/sh
# $Id$

EXAMPLE_FILES="main.tex shuji.tex main.pdf shuji.pdf thutils.sty Makefile"
TEMPLATE_FILES="thuthesis.ins thuthesis.dtx thubib.bst Readme thuthesis.pdf thuthesis.cls thuthesis.cfg"
ALL_FILES="$EXAMPLE_FILES $TEMPLATE_FILES"
ALL_DIRS="data figures ref"

# $1 should be the version number
if [ $# -lt 2 ]; then
    echo "Forget the version number or encode name?"
    echo "Usage: ./makedist.sh <version#> <encode>"
    exit 2
fi

version=$1
encode=$2
templatedir="thuthesis@$encode-$version/"
templatetar="thuthesis@$encode-$version.tgz"

if [ -d $templatedir ]
then
  echo "clean old files"
  rm -rf $templatedir
fi
mkdir -p $templatedir

echo "Copy dirs...."
# have to cleanup tmp files in data/
find data -maxdepth 1 -type f -not -iname "*.tex" -exec rm {} \;
rm -rf data/auto
tar cp --exclude ".git" $ALL_DIRS | (cd $templatedir ; tar xp)

echo "Copy files...."
cp -f $ALL_FILES $templatedir

echo "Create tarball...."
rm -f $templatetar
tar zcvf $templatetar $templatedir
rm -rf $templatedir

echo "$templatetar is created."
