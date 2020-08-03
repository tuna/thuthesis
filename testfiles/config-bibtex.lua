checksuppfiles = {"*.tex", "*.bib"}
testfiledir = "testfiles/10-bibtex"

includetests = {"*"}
excludetests = {}

checkruns = 3

function runtest_tasks(name, run)
  if run == 1 then
    return "bibtex -terse " .. name
  else
    return ""
  end
end
