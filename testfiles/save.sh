save_file () {
    test="$1";
    if [[ "$test" == 01-title-page-academic-* || "$test" == 01-title-page-professional-* || "$test" == 02-title-page-* ]]; then
        config="title-page-en";
    elif [[ "$test" == 01-title-page-* ]]; then
        config="title-page";
    elif [[ "$test" == 06-* || "$test" == 07-* || "$test" == 09-* || "$test" == *-hyperref ]]; then
        config="crossref";
    elif [[ "$test" == *-nomencl ]]; then
        config="nomencl";
    elif [[ "$test" == 10-bibtex ]]; then
        config="bibtex";
    elif [[ "$test" == 10-biblatex ]]; then
        config="biblatex";
    else
        config="main";
    fi

    if [[ "$config" == "main" ]]; then
        l3build save --quiet "$test" || exit 1;
    else
        l3build save --quiet --config "testfiles/config-$config" "$test" || exit 1;
    fi
}


save_config () {
    config="$1";
    if [[ "$config" == "title-page" ]]; then
        test_dir="testfiles/01-title-page";
    elif [[ "$config" == "title-page-en" ]]; then
        test_dir="testfiles/01-title-page-en";
    elif [[ "$config" == "main" ]]; then
        test_dir="testfiles";
    elif [[ "$config" == "crossref" ]]; then
        test_dir="testfiles";
    elif [[ "$config" == "nomencl" ]]; then
        test_dir="testfiles/08-notation-nomencl";
    elif [[ "$config" == "bibtex" ]]; then
        test_dir="testfiles/10-bibtex";
    elif [[ "$config" == "biblatex" ]]; then
        test_dir="testfiles/10-biblatex";
    fi

    for testfile in "$test_dir"/*.tex; do
        test="$(basename "$testfile" .tex)";
        if [[ "$config" == "main" ]]; then
            if [[ "$test" == 06-* || "$test" == 07-* || "$test" == 09-* || "$test" == *-hyperref ]]; then
                continue
            fi
            l3build save --quiet "$test" || exit 1;
        elif [[ "$config" == "crossref" ]]; then
            if [[ "$test" == 06-* || "$test" == 07-* || "$test" == 09-* || "$test" == *-hyperref ]]; then
                l3build save --quiet --config testfiles/"config-$config" "$test" || exit 1;
            fi
        else
            l3build save --quiet --config testfiles/"config-$config" "$test" || exit 1;
        fi
    done
}


if [[ $# -eq 0 ]]; then
    for config in title-page title-page-en main crossref nomencl bibtex biblatex; do
        save_config $config;
    done
else
    case $1 in
        title-page|title-page-en|main|crossref|nomencl|bibtex|biblatex)
            save_config "$1";
            ;;

        *)
            save_file "$1";
            ;;
    esac
fi
