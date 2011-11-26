#!/usr/bin/env python
# -*- coding: utf-8 -*-

try:
    from subprocess import check_output
except ImportError: # python 2.6 has no check_output
    from subprocess import Popen, PIPE
    def check_output(cmdline):
        return Popen(cmdline, stdout=PIPE).communicate()[0]

from string import split
import re

fontliststr = check_output(["fc-list", ":lang=zh"])
if not fontliststr:
    print("No Chinese font exists! Leaving...")
    exit(1)

fontlist = fontliststr.split("\n")
fontnamelist = []
songtilist = []
kaitilist = []
heitilist = []
fangsonglist = []
lishulist = []
youyuanlist = []

# strip out ':style=BLABLA' stuff
for x in fontlist:
    fontnamelist.append(x.split(":")[0])

for x in fontnamelist:
    if re.search("仿宋|FangSong", x, re.IGNORECASE):
        fangsonglist.append(x)
    elif re.search("宋|Ming", x, re.IGNORECASE):
        songtilist.append(x)
    elif re.search("黑", x, re.IGNORECASE):
        heitilist.append(x)
    elif re.search("楷", x, re.IGNORECASE):
        kaitilist.append(x)
    elif re.search("隶|Li", x, re.IGNORECASE):
        lishulist.append(x)
    elif re.search("幼圆|YouYuan", x, re.IGNORECASE):
        youyuanlist.append(x)
    else:
        pass

def selectfont(fontlist):
    if not fontlist:
        return ''
    for i, v in enumerate(fontlist):
        print i, v
    while True:
        n_str = raw_input("选择一个：(输入数字[0-" + str(len(fontlist)-1) + "]，默认0)")
        if not n_str:
            n = 0
        else:
            try:
                n = int(n_str)
            except ValueError:
                continue
        if 0 <= n < len(fontlist):
            break
    return fontlist[n].split(",")[-1]

print("宋体：")
songti = selectfont(songtilist)
print("黑体：")
heiti = selectfont(heitilist)
print("楷体：")
kaiti = selectfont(kaitilist)
print("仿宋：")
fangsong = selectfont(fangsonglist)
print("隶书：")
lishu = selectfont(lishulist)
print("幼圆：")
youyuan = selectfont(youyuanlist)

if not songti or not heiti or not kaiti:
    print "错误：缺少宋体、黑体或楷体字体"
    exit(2)

print "生成字体文件fontname.def"
with open('fontname.def', 'w') as f:
    f.write("\\ProvidesFile{fontname.def}\n")
    f.write("\\newcommand{\\fontsong}{" + songti + "}\n")
    f.write("\\newcommand{\\fonthei}{" + heiti + "}\n")
    f.write("\\newcommand{\\fontkai}{" + kaiti + "}\n")
    if fangsong:
        f.write("\\newcommand{\\fontfs}{" + fangsong + "}\n")
    else:
        print "缺少仿宋，宋体代替"
        f.write("\\newcommand{\\fontfs}{" + songti + "}\n")
    if lishu:
        f.write("\\newcommand{\\fontli}{" + lishu + "}\n")
    else:
        print "缺少隶书，宋体代替"
        f.write("\\newcommand{\\fontli}{" + songti + "}\n")
    if youyuan:
        f.write("\\newcommand{\\fontyou}{" + youyuan + "}\n")
    else:
        print "缺少幼圆，宋体代替"
        f.write("\\newcommand{\\fontyou}{" + songti + "}\n")

