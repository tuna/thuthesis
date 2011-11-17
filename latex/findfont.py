#!/usr/bin/env python

import sys

songlist = ['Adobe Song Std', 'AR PL SungtiL GB']
heilist = ['Adobe Heiti Std', 'WenQuanYi Zen Hei']
kailist = ['Adobe Kaiti Std', 'AR PL KaitiM GB']
fslist = ['Adobe Fangsong Std']
lilist = []
youlist = []

fontlist = []
for f in sys.stdin.readlines():
	fontlist.append(f[0:-1])

def findfont(flist):
	for fname in flist:
		if fname in fontlist:
			return fname

song = findfont(songlist)
if not song:
	print >> sys.stderr, "Unable to find font song."
	sys.exit(1)
hei = findfont(heilist) or song
kai = findfont(kailist) or song
fs = findfont(fslist) or song
li = findfont(lilist) or song
you = findfont(youlist) or song
print "\\ProvidesFile{fontname.def}"
print "\\newcommand{\\fontsong}{%s}" % song
print "\\newcommand{\\fonthei}{%s}" % hei
print "\\newcommand{\\fontkai}{%s}" % kai
print "\\newcommand{\\fontfs}{%s}" % fs
print "\\newcommand{\\fontli}{%s}" % li
print "\\newcommand{\\fontyou}{%s}" % you
