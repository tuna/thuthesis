testfiledir = "testfiles/06-notation-nomencl"
testsuppdir = testfiledir .. "/support"

checkruns = 2

function runtest_tasks(name)
    return "makeindex -s nomencl.ist -o " .. name .. ".nls " .. name .. ".nlo"
end
