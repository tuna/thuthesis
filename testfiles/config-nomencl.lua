testfiledir = "testfiles/08-notation-nomencl"
testsuppdir = testfiledir .. "/support"

includetests = {"*"}
excludetests = {}

checkruns = 2

function runtest_tasks(name, run)
  if run == 1 then
    return "makeindex -s nomencl.ist -o " .. name .. ".nls " .. name .. ".nlo"
  else
    return ""
  end
end
