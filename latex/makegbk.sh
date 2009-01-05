#!/bin/sh

# source files need converting
UTF8_FILES="thuthesis.ins thuthesis.dtx thutils.sty thubib.bst Readme main.tex shuji.tex"
UTF8_DIRS="data ref"
# files for publishing
EXTRA_DIRS="figures"
EXTRA_FILES="Makefile msmake.cmd"

GBKDIR="./gbk"

# arg 1: the file name
function myconvert
{
  iconv -f utf8 -t gbk $1 > $GBKDIR/$1
}

# remove the dest
if [ "$1A" = "-fA" ]
then
  rm -rf $GBKDIR
fi

# create top temp dir
if [ ! -d $GBKDIR ]
then
  echo "creating stub folders"
  mkdir -p $GBKDIR
else
  echo "gbk/ already exists, remove it first!"
  exit
fi

# convert template files
for f in $UTF8_FILES
do
  echo "processing $f"
  myconvert $f
done

# convert example files
for d in $UTF8_DIRS
do
  echo "processing $d/"
  mkdir -p $GBKDIR/$d
  for f in `ls $d` # include the path, without .svn
  do
    echo "  $f"
    myconvert "$d/$f"
  done
done

# copy extra files
echo "copying $EXTRA_DIRS"
tar cp --exclude ".svn" --exclude ".git" $EXTRA_DIRS | (cd $GBKDIR ; tar xp)

echo "copying $EXTRA_FILES"
cp -f $EXTRA_FILES $GBKDIR

# processing thuthesis.dtx and Makefile
cd $GBKDIR

sed \
  -e "s/ExecuteOptions{utf/ExecuteOptions{gbk/" \
  -e "s/dtx@UTFtrue/dtx@UTFfalse/" \
  -e "s/RequirePackage{CJKutf8}/RequirePackage{CJK}/" \
  -e "s/CJKbookmarks=false/CJKbookmarks=true/" \
  -e "s/{UTF8}{song}/{GBK}{song}/" \
  -e "s/@=128/@=127/" \
  -e "s/<254/<255/" \
     thuthesis.dtx > gbksed.tmp

mv gbksed.tmp thuthesis.dtx

sed -e "s/# gbk2uni/gbk2uni/" Makefile > gbksed.tmp
mv gbksed.tmp Makefile

echo "GBK convesion success."
