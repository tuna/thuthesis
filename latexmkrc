# vim: set ft=perl:

$pdf_mode = 5;

# Auto-run bibtex on the per-appendix .aux files produced by the bibunits
# package (loaded automatically when natbib is active). thuthesis writes
# one auxiliary file per appendix chapter named <jobname>-appendix-{a,b,
# c,...}.aux (see \@bibunitname in thuthesis.cls); latexmk's built-in
# bibtex rule only fires on the main .aux, so without this hook a single
# latexmk invocation cannot resolve appendix bibliographies and users
# have to run the manual sequence documented in thuthesis.dtx
# (xelatex; bibtex <job>.aux; bibtex <job>-appendix-a.aux; xelatex...).
#
# After each (xe|lua)latex pass we run bibtex on every *-appendix-*.aux
# file containing \bibdata; the next latex iteration then sees fresh
# appendix .bbl files and resolves the citations, so `latexmk <jobname>`
# converges in one invocation. The hook is a no-op when no appendix
# bibliographies are present, so existing users see no change.
#
# Implemented in pure Perl and invoked via latexmk's "internal" command
# mechanism so it works on Windows / macOS / Linux without depending on
# a POSIX shell.
sub run_appendix_bibtex_passes {
    foreach my $aux (glob('*-appendix-*.aux')) {
        next unless -f $aux;
        open(my $fh, '<', $aux) or next;
        my $has_bibdata = 0;
        while (my $line = <$fh>) {
            if ($line =~ /\\bibdata/) { $has_bibdata = 1; last; }
        }
        close($fh);
        if ($has_bibdata) {
            (my $base = $aux) =~ s/\.aux\z//;
            system('bibtex', $base);
        }
    }
    return 0;
}
sub xelatex_with_appendix_bibtex {
    my $rc = system('xelatex', @_);
    run_appendix_bibtex_passes();
    return $rc;
}
sub lualatex_with_appendix_bibtex {
    my $rc = system('lualatex', @_);
    run_appendix_bibtex_passes();
    return $rc;
}
$xelatex  = 'internal xelatex_with_appendix_bibtex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -no-pdf -synctex=1 %O %S';
$lualatex = 'internal lualatex_with_appendix_bibtex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S';
$xdvipdfmx = "xdvipdfmx -q -E -o %D %O %S";

$bibtex_use = 1.5;

$clean_ext = "hd loe ptc run.xml synctex.gz thm xdv";

$makeindex = "makeindex -s gind.ist %O -o %D %S";

add_cus_dep('nlo', 'nls', 0, 'nlo2nls');
sub nlo2nls {
    system("makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"");
}
push @generated_exts, 'nlo', 'nls';
