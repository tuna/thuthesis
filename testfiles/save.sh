save_config ()
    if [[ "$1" == "main" ]]; then
        for testfile in testfiles/*.tex; do
            test="$(basename "$testfile" .tex)";
            if ! [[ "$test" == 06-* || "$test" == 07-* || "$test" == 09-* ]]; then
                l3build save --quiet "$test" || exit 1;
            fi
        done

    elif [[ "$1" == "crossref" ]]; then
        for testfile in testfiles/*.tex ; do
            test="$(basename "$testfile" .tex)";
            if [[ "$test" == 06-* || "$test" == 07-* || "$test" == 09-* ]]; then
                l3build save --quiet --config testfiles/config-crossref "$test" || exit 1;
            fi
        done

    elif [[ "$1" == "cover" ]]; then
        for testfile in testfiles/01-cover/*.tex; do
            test="$(basename "$testfile" .tex)";
            l3build save --quiet --config testfiles/config-cover "$test" || exit 1;
        done

    elif [[ "$1" == "nomencl" ]]; then
        for testfile in testfiles/08-notation-nomencl/*.tex; do
            test="$(basename "$testfile" .tex)";
            l3build save --quiet --config testfiles/config-nomencl "$test" || exit 1;
        done

    elif [[ "$1" == "bibtex" ]]; then
        for testfile in testfiles/10-bibtex/*.tex; do
            test="$(basename "$testfile" .tex)";
            l3build save --quiet --config testfiles/config-bibtex "$test" || exit 1;
        done

    elif [[ "$1" == "biblatex" ]]; then
        for testfile in testfiles/10-biblatex/*.tex; do
            test="$(basename "$testfile" .tex)";
            l3build save --quiet --config testfiles/config-biblatex "$test" || exit 1;
        done
    fi




if [[ $# -eq 0 ]]; then
    for config in main crossref cover nomencl bib; do
        save_config $config;
    done
else
    save_config $1;
fi
