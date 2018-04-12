# vim: set ft=perl:
$xdvipdfmx="xdvipdfmx -E -o %D %O %S";
$clean_ext = 'thm glo gls bbl hd loe synctex.gz xdv';
$makeindex = 'makeindex -s gind.ist %O -o %D %S';
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}
