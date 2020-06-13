#!/usr/bin/env texlua

-- skip all tests
includetests = {}

-- include .tds.zip in archive
packtdszip = true

-- specify some files of their correct TDS locations
tdslocations = {
  "bibtex/bst/thuthesis/*.bst",
  "tex/latex/thuthesis/tsinghua-name-bachelor.pdf",
}
