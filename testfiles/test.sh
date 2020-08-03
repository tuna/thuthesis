if [ $# -eq 0 ]; then
    l3build check;
    exit
fi


test_name="$1";
test_file="$1.tex";

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
    latexmk -xelatex -cd -pv "$build_dir/$test_file";
    cp "$build_dir/$test_name.pdf" "${file_path%.tex}.pdf";
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
