for testfile in testfiles/*.tex; do
    test="$(basename "$testfile" .tex)";
    echo $test;
    texlua testfiles/build-pdf.lua save --quiet "$test";
done

for testfile in testfiles/01-cover/*.tex; do
    test="$(basename "$testfile" .tex)";
    echo $test;
    texlua testfiles/build-pdf.lua save --quiet --config testfiles/config-cover "$test";
done

for testfile in testfiles/06-notation-nomencl/*.tex; do
    test="$(basename "$testfile" .tex)";
    echo $test;
    texlua testfiles/build-pdf.lua save --quiet --config testfiles/config-nomencl "$test";
done

for testfile in testfiles/08-bib/*.tex; do
    test="$(basename "$testfile" .tex)";
    echo $test;
    texlua testfiles/build-pdf.lua save --quiet --config testfiles/config-bib "$test";
done
