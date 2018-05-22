"""""""""""""""""""""""GENERAL STUFF""""""""""""""""""""""""""
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


" Highlights the cursor position VERY OBVIOUSLY
set cursorline
set cursorcolumn
hi CursorColumn ctermbg=Black
hi CursorLine cterm=Bold ctermbg=LightBlue ctermfg=Black
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=Blue ctermfg=Black
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=LightBlue ctermfg=Black

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


""""""""""""""""""""""""""GENERAL MAPS""""""""""""""""""""""""
noremap x "_x

""""""""""""""""""""""""INSERT MODE MAPS"""""""""""""""""""""

" press i i to exit insert mode.
imap ii <C-[>
imap II <C-[>


""""""""""""""""""""""""NORMAL MODE MAPS"""""""""""""""""""""

" <leader> l will highlight the current line.
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Sends things away without overwriting the register
nnoremap <leader>d "_d

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
" Sends things away without overwriting the register
vnoremap <leader>d "_d
