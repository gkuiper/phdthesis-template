$go_mode = 1;
$cleanup_fdb = 1;
$pdf_mode = 1;
# make a copy of the resulting PDF file (mainly for inspecting intermediate results)
$pdflatex = 'pdflatex -shell-escape %O %S && cp %D %B-copy.pdf';
$makeindex  = 'makeindex -s thesis-index.ist %O -o %D %S';
$preview_continuous_mode = 0;
$max_repeat = 9;
if($^O eq 'linux') {
	$pdf_previewer = 'okular `basename %S .pdf`-copy.pdf &';
	$pdf_update_method = 0;
} else {
	$pdf_previewer = 'open -a Skim %S';
	$pdf_update_method = 0;
}
@default_files = ("thesis.tex");

$recorder = 1;
$hash_calc_ignore_pattern{'xmpi'} = '^.*$';

$ENV{'TEXMFHOME'} = "$ENV{PWD}/texmf";
$ENV{'TEXMFVAR'} = "$ENV{PWD}/texmf";
$ENV{'TEXMFCONFIG'} = "$ENV{PWD}/texmf";

# next two lines should be done by make
#system("mktexlsr ./texmf");
#system("updmap");

# Make glossaries
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q '$_[0]'";
  }
  else {
    system "makeglossaries '$_[0]'";
  };
}

push @generated_exts, 'glo';
push @generated_exts, 'gls';
push @generated_exts, 'glg';
push @generated_exts, 'acn';
push @generated_exts, 'acr';
push @generated_exts, 'ist';
push @generated_exts, 'alg';
push @generated_exts, 'bbl';
push @generated_exts, 'glono';
push @generated_exts, 'glsno';
