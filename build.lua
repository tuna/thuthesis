#!/usr/bin/env texlua

module = "thuthesis"

supportdir = "./testfiles/support"
checksuppfiles = {"*.tex"}

docfiles = {
  "CHANGELOG.md",
  "thuthesis-example.tex",
  "spine.tex",
  "thusetup.tex",
  "data",
  "ref",
}
installfiles = {"*.cls", "*.bst", "*.bbx", "*.cbx", "tsinghua-name-bachelor.pdf"}
sourcefiles = {"*.dtx", "*.ins", "*.bst", "*.bbx", "*.cbx", "tsinghua-name-bachelor.pdf"}
tagfiles = {"*.dtx", "CHANGELOG.md", "package.json"}
textfiles = {"*.md"}
typesetdemofiles = {"thuthesis-example.tex", "spine.tex"}

excludetests = {
  "06-*",
  "07-*",
  "09-*",
  "*-hyperref",
}

checkengines = {"xetex"}
stdengine = "xetex"

checkconfigs = {
  "build",
  "testfiles/config-title-page",
  "testfiles/config-title-page-en",
  "testfiles/config-crossref",
  "testfiles/config-nomencl",
  "testfiles/config-bibtex",
  "testfiles/config-biblatex",
}

-- include .tds.zip in build output
packtdszip = true

-- specify some files of their correct TDS locations
tdslocations = {
  "bibtex/bst/thuthesis/*.bst",
  "tex/latex/thuthesis/tsinghua-name-bachelor.pdf",
}

typesetexe = "xelatex"
unpackexe = "xetex"
bibtexexe = "bibtex"
bibtexopts = ""
biberopts = "--quiet"

specialtypesetting = specialtypesetting or {
  ["thuthesis-example.tex"] = {
    func = function (file)
      local name = jobname(file)
      local errorlevel = tex(file)
      if errorlevel == 0 then
        -- Return a non-zero errorlevel if anything goes wrong
        errorlevel =(
          bibtex(name) +
          bibtex(name .. "-appendix-a") +
          tex(file) +
          bibtex(name) +
          bibtex(name .. "-appendix-a") +
          tex(file) +
          tex(file)
        )
      end
      return errorlevel
    end
  }
}

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-shell-escape -file-line-error -halt-on-error -interaction=nonstopmode"

lvtext = ".tex"

maxprintline = 79 -- keep compatibility with existing test files

function docinit_hook()
  for _, file in pairs({"dtx-style.sty"}) do
    cp(file, unpackdir, typesetdir)
  end
  return 0
end

function update_tag(file, content, tagname, tagdate)
  local url = "https://github.com/tuna/thuthesis"
  local date = string.gsub(tagdate, "%-", "/")
  if string.match(file, "%.dtx$") then
    if string.match(content, "%d%d%d%d/%d%d/%d%d [0-9.]+") then
      content = string.gsub(content, "%d%d%d%d/%d%d/%d%d [0-9.]+",
        date .. " " .. tagname)
    end
    if string.match(content, "\\def\\version{[0-9.]+}") then
      content = string.gsub(content, "\\def\\version{[0-9.]+}",
        "\\def\\version{" .. tagname .. "}")
    end

  elseif string.match(file, "CHANGELOG.md") then
    local previous = string.match(content, "/compare/(.*)%.%.%.HEAD")
    local gittag = 'v' .. tagname

    if gittag == previous then return content end
    content = string.gsub(content,
      "## %[Unreleased%]",
      "## [Unreleased]\n\n## [" .. gittag .."] - " .. tagdate)
    content = string.gsub(content,
      previous .. "%.%.%.HEAD",
      gittag .. "...HEAD\n" ..
      string.format("%-14s", "[" .. gittag .. "]:") .. url .. "/compare/"
        .. previous .. "..." .. gittag)

  elseif string.match(file, "package.json") then
    content = string.gsub(content,
      "\"version\": \"[0-9.]+\"",
      "\"version\": \"" .. tagname .. "\"")
  end

  return content
end
