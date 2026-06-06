# vim: set ft=perl:

$pdf_mode = 5;

$xelatex = "xelatex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -no-pdf -synctex=1 %O %S";
$lualatex = "lualatex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -q -E -o %D %O %S";

$bibtex_use = 1.5;

$clean_ext = "hd loe ptc run.xml synctex.gz thm xdv ccf";

$makeindex = "makeindex -s gind.ist %O -o %D %S";

add_cus_dep('nlo', 'nls', 0, 'nlo2nls');
sub nlo2nls {
    system("makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"");
}
push @generated_exts, 'nlo', 'nls';

# 使用 citation-style-language（citeproc-lua）时自动调用 citeproc-lua 生成参考文献。
# 该宏包在非 LuaTeX 引擎下会写出 <jobname>.ccf 作为 latexmk 的触发标记，因此仅在文档
# 真正使用了 citation-style-language 时（即存在 .ccf）才运行 citeproc-lua；默认的
# bibtex / biber 流程完全不受影响，无需用户做任何额外配置。
add_cus_dep('ccf', 'bbl', 0, 'csl2bbl');
sub csl2bbl {
    return system("citeproc-lua", "$_[0].aux");
}
push @generated_exts, 'ccf';
