#!/usr/bin/env texlua

module = "thuthesis"

supportdir = "./testfiles/support-main"

checksuppfiles = {"fontset.tex"}
demofiles = {"main.tex", "thusetup.tex", "math_commands.tex", "data", "figures", "ref"}
installfiles = {"*.cls", "*.bst", "tsinghua.pdf"}
sourcefiles = {"*.dtx", "*.ins", "*.bst", "tsinghua.pdf"}

checkengines = {"xetex"}
stdengine = "xetex"

checkconfigs = {
    -- "build",
    -- "testfiles/config-cover",
    "testfiles/config-nomencl",
    -- "testfiles/config-bib",
}

typesetexe = "xelatex"
unpackexe = "xetex"

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-file-line-error -halt-on-error -interaction=nonstopmode"

lvtext = ".tex"
