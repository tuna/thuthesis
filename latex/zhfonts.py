#!/usr/bin/env python
# -*- coding: utf-8 -*-

# This script provide you with the Chinese fonts found by fc-list,
# let you choose which to use with thuthesis.

# The script prefers the font name in ASCII to the one containing Unicode
# character, thus trying to avoid the problem with 'Adobe 宋体 Std L'.

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
    asciifontname = ''
    for x in fontlist[n].split(","):
        try:
            x.decode('ascii')
        except UnicodeDecodeError:
            pass
        else:
            asciifontname = x
            break
    if asciifontname:
        return asciifontname
    else:
        print "ASCII font name not found!"
        print "You might encounter error using this font with XeLaTeX..."
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

error_msg = ""
error_critical = False
if not songti:
    error_msg += "Fatal error: missing font Song\\\\"
    error_critical = True
if not heiti:
    error_msg += "错误：缺少黑体，使用宋体代替\\\\"
    error_critical = True
if not kaiti:
    error_msg += "错误：缺少楷体，使用宋体代替\\\\"
    error_critical = True
if not fangsong:
    error_msg += "缺少仿宋，使用宋体代替\\\\"
if not lishu:
    error_msg += "缺少隶书，使用宋体代替\\\\"
if not youyuan:
    error_msg += "缺少幼圆，使用宋体代替\\\\"
if error_msg and not error_critical:
    error_msg += "如对字体替换表示满意，需去除该提示，请手工编辑" \
        "fontname.def文件，将\\textbackslash{}thu@fontmissingtrue去除。\\\\"

print "生成字体文件fontname.def"
with open('fontname.def', 'w') as f:
    f.write("\\ProvidesFile{fontname.def}\n")
    f.write("\\newcommand{\\fontsong}{" + songti + "}\n")
    f.write("\\newcommand{\\fonthei}{" + (heiti or songti) + "}\n")
    f.write("\\newcommand{\\fontkai}{" + (kaiti or songti) + "}\n")
    f.write("\\newcommand{\\fontfs}{" + (fangsong or songti) + "}\n")
    f.write("\\newcommand{\\fontli}{" + (lishu or songti) + "}\n")
    f.write("\\newcommand{\\fontyou}{" + (youyuan or songti) + "}\n")
    if error_msg:
        f.write("\\thu@fontmissingtrue\n")
        f.write("\\renewcommand{\\fontwarning}{%s}\n" % error_msg[0:-2])
