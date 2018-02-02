add_cus_dep( 'tex', 'aux', 0, 'makeexternaldocument' );

$pdflatex = 'pdflatex -8bit -etex -halt-on-error -synctex=1 %O %S';
$pdf_mode = 1;
$bibtex_use = 1;

sub makeexternaldocument {
    # if the dependency isn't one of the files that this latexmk run will consider, process it
    # without this test, we would get an infinite loop!
    if (!($root_filename eq $_[0]))
    {
        system( "latexmk \"$_[0]\"" );
    }
}
