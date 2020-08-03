checksuppfiles = {"*.tex", "*.bib"}
testfiledir = "testfiles/10-biblatex"

includetests = {"*"}
excludetests = {}

checkruns = 3

function runtest_tasks(name, run)
  if run == 1 then
    return "biber " .. name
  else
    return ""
  end
end
