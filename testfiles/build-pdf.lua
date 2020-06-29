#!/usr/bin/env texlua

module = "thuthesis"

supportdir = "./testfiles/support-pdf"

checksuppfiles = {"fontset.tex"}
demofiles = {"thuthesis-example.tex", "thusetup.tex", "data", "figures", "ref"}
installfiles = {"*.cls", "*.bst", "tsinghua-name-bachelor.pdf"}
sourcefiles = {"*.dtx", "*.ins", "*.bst", "tsinghua-name-bachelor.pdf"}

checkengines = {"xetex"}
stdengine = "xetex"

checkconfigs = {
    "build", "testfiles/config-cover", "testfiles/config-nomencl",
    "testfiles/config-bib",
}

typesetexe = "xelatex"
unpackexe = "xetex"

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-file-line-error -halt-on-error -interaction=nonstopmode"

pvtext = ".tex"
tpfext = ".pdf"

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
