#!/bin/sh
fc-list | cut -d : -f 1 | tr , "\n" | python findfont.py > fontname.def
exit $?
