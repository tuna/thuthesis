#!/bin/sh
# $Id: $

dirs="data figures ref"
list_example="data/* figures/* main.pdf main.tex ref/* shuji.pdf shuji.tex"
list_template="*.mak *.tbl CJKpunct.sty Makefile Readme chinesebst.bst extended.chx thubib.bst thuthesis.dtx thuthesis.ins thuthesis.pdf thutils.sty"

if [ $0 != ./makedist.sh ]; then
    echo "This script can only be run in the same directory of the script."
    echo "Using relative path to call as './makedist.sh'."
    exit 1
fi

daysold=`daysold`

for dir in $dirs
do
    mkdir -p example-$daysold/$dir
    mkdir -p template-$daysold/$dir
done

for file in $list_example
do
    cp -f $file example-$daysold/$file
done

for file in $list_template
do
    cp -f $file template-$daysold/$file
done

pushd example-$daysold
tar jcvf ../example-$daysold.tar.bz2 *
popd

pushd template-$daysold
tar jcvf ../template-$daysold.tar.bz2 *
popd
