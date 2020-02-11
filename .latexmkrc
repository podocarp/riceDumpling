$ENV{'TEXINPUTS'}='~/texmf//:'
. $ENV{'TEXINPUTS'};
$pdflatex = 'pdflatex -synctex=1 --shell-escape %O %S';
