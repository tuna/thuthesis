if [ $# -eq 0 ]; then
    l3build check;
    exit
fi


test_name="$1";
test_file="$1.tex";

baseline_dir="testfiles/baseline"
diff_dir="testfiles/diff"


file_path="testfiles/$test_file";
support_dir="testfiles/support";
pdf_test_fontset_file="testfiles/support-pdf/thuthesis-pdf-test-config.tex";

do_test () {
    build_dir="build/testpdf";
    if [ -d "$build_dir" ]; then
        rm -rf "$build_dir/*";
    else
        mkdir -p "$build_dir";
    fi
    l3build unpack;
    cp build/local/* "$build_dir"/;
    file_path="$1";
    support_dir="$2";
    cp "$file_path" "$build_dir"/;
    cp "$support_dir"/* "$build_dir"/;
    cp "$pdf_test_fontset_file" "$build_dir"/;
    latexmk -xelatex -cd "$build_dir/$test_file";
    output_path="${file_path%.tex}.pdf";
    mv "$build_dir/$test_name.pdf" "$output_path";
    baseline_path="$baseline_dir/$test_name.pdf";
    if [ -f "$baseline_path" ]; then
        if [ ! -d "$diff_dir" ]; then
            mkdir -p "$diff_dir";
        fi
        diff_path="$diff_dir/$test_name.pdf";
        diff-pdf --output-diff="$diff_path" "$baseline_path" "$output_path";
        open "$diff_path";
    else
        open "$output_path";
    fi
}


if [ -f "$file_path" ]; then
    echo $file_path;
    do_test $file_path $support_dir;
else
    for test_dir in testfiles/*; do
        if [ -d "$test_dir" ]; then
            file_path="$test_dir/$test_file";
            # support_dir="$test_dir/support";
            if [ -f "$file_path" ]; then
                echo $file_path;
                do_test $file_path $support_dir;
                break
            fi
        fi
    done
fi
