$ENV{'TEXINPUTS'}='~/texmf//:'
. $ENV{'TEXINPUTS'};
$pdflatex = 'pdflatex --shell-escape %O %S';
