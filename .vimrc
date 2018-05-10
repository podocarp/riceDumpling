""""""""""""""""""""V E E M   A R E   S E E""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""GENERAL STUFF""""""""""""""""""""""""""
set mouse=a
" line number
set number relativenumber
set ruler
set nobackup
set nocompatible
set viminfo=
set showcmd
set autoindent
set noswapfile

"underlines the current line being edited
set cursorline

" tab completion stuff
set wildmenu
set wildmode=list:longest,full

" highlight search
set hlsearch

" scrolling past the line pops you below
set whichwrap+=<,>,h,l,[,]

" change default split behavior
set splitright
set splitbelow

" syntax highlighting
filetype on
filetype plugin on
syntax enable

""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'

call plug#end()

colorscheme wal

""""""""""""""""""""""""INSERT MODE MAPS"""""""""""""""""""""
" press i i to exit insert mode.
imap ii <C-[>
imap II <C-[>



"""""""""""""""""""""""NORMAL MODE MAPS"""""""""""""""""""""
" swap the : and ; keys because one is used more than the other
nnoremap ; :
" <leader> l will highlight the current line.
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" p pastes before the line and P pastes after. Makes more sense when pasting
" to empty lines
nnoremap p P
nnoremap P p

" same thing, but for o and O
nnoremap o O
nnoremap O o
""""""""""""""""""""""SPLIT WINDOWS""""""""""""""""""""""
" for moving windows
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" for moving focus between windows
nnoremap <C-h> <C-W><C-h>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>

"""""""""""""""""""""VISUAL MODE MAPS""""""""""""""""""""""
vnoremap ; :

