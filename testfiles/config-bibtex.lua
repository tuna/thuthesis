checksuppfiles = {"*.tex", "*.bib"}
testfiledir = "testfiles/10-bibtex"

includetests = {"*"}
excludetests = {}

checkruns = 3

function runtest_tasks(name, run)
  if run == 1 then
    local tasks = {"bibtex -terse " .. name}
    table.insert(tasks, "bibtex -terse " .. name .. "-appendix-a")
    table.insert(tasks, "bibtex -terse " .. name .. "-appendix-b")
    table.insert(tasks, "bibtex -terse " .. name .. "-index")
    return table.concat(tasks, os_concat)
  else
    return ""
  end
end
