#!/bin/sh

# source files need converting
GBK_FILES="thuthesis.ins thuthesis.dtx thutils.sty thubib.bst Readme main.tex shuji.tex"
GBK_DIRS="data ref"
# files for publishing
EXTRA_DIRS="figures"
EXTRA_FILES="Makefile msmake.cmd"


UTF8DIR="./utf8"

# arg 1: the file name
function myconvert
{
  iconv -f gbk -t utf8 $1 > $UTF8DIR/$1
}

# create top temp dir
if [ ! -d $UTF8DIR ]
then
  echo "creating stub folders"
  mkdir -p $UTF8DIR
fi

# convert template files
for f in $GBK_FILES
do
  echo "processing $f"
  myconvert $f
done

# convert example files
for d in $GBK_DIRS
do
  echo "processing $d/"
  mkdir -p $UTF8DIR/$d
  for f in `ls $d` # include the path, without .svn
  do
    echo "  $f"
    myconvert "$d/$f"
  done
done

# copy extra files
echo "copying $EXTRA_DIRS"
tar cp --exclude ".svn" $EXTRA_DIRS | (cd $UTF8DIR ; tar xp)

echo "copying $EXTRA_FILES"
cp -f $EXTRA_FILES $UTF8DIR

# processing thuthesis.dtx
cd $UTF8DIR

sed \
  -e "s/RequirePackage{CJK}/RequirePackage{CJKutf8}/" \
  -e "/IfFileExists{CJKpunct.sty}/d" \
  -e "/CJKbookmarks=true/d" \
  -e "s/{GBK}{song}/{UTF8}{song}/" \
  -e "s/@=127/@=128/" \
  -e "s/<255/<254/" \
     thuthesis.dtx > utf8sed.tmp

mv utf8sed.tmp thuthesis.dtx

echo "UTF8 convesion success."
