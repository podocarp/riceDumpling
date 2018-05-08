set number relativenumber
set ruler
nore ; :
nore , ;
set nobackup
imap ii <C-[>
set nocompatible
set viminfo=
set showcmd
filetype on
filetype plugin on
syntax enable
set autoindent

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" highlight search
set hlsearch

set whichwrap+=<,>,h,l,[,]
