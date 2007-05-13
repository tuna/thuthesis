#!/bin/sh
# $Id: makedist.sh 47 2006-03-20 03:47:47Z edyfox $

dirs="data figures ref"
list_example="data/*.tex figures/* ref/*.bib main.tex shuji.tex main.pdf  shuji.pdf"
list_template="thuthesis.ins thuthesis.dtx thubib.bst Readme thuthesis.pdf Makefile msmake.cmd thutils.sty"
list_extra="thuthesis.cls thuthesis.cfg"
list_all="$list_example $list_template $list_extra"

if [ $0 != ./makedist.sh ]; then
    echo "This script can only be run in the same directory of the script."
    echo "Using relative path to call as './makedist.sh'."
    echo "Usage: ./makedist.sh <version#>"
    exit 1
fi

# $1 should be the version number
if [ $# -lt 1 ]; then
    echo "Forget the version number?"
    echo "Usage: ./makedist.sh <version#>"
    exit 2
fi

version=$1
templatedir="thuthesis-$version/"
templatetar="thuthesis-$version.tgz"

CP="cp -f --parents"

echo "Create dirs...."
for dir in $dirs
do
    mkdir -p $templatedir/$dir
done

echo "Copy files ...."
for file in $list_all
do
    $CP $file $templatedir
done

echo "Create tarball...."
rm -f $templatetar
tar zcvf $templatetar $templatedir
rm -rf $templatedir

echo ""
echo "$templatetar is created."