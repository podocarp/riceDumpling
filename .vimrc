"""""""""""""""""""""""GENERAL STUFF""""""""""""""""""""""""""
set mouse=a
set number relativenumber
set ruler
set nobackup
set nocompatible
set viminfo=
set showcmd
set autoindent
set noswapfile
set nowrap
" Displays full path in status bar
set statusline+=%F\ %l\:%c
"""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"""""""Autocomplete stuff
Plugin 'lifepillar/vim-mucomplete'
set completeopt+=menuone,noselect,noinsert,longest
set shortmess+=c
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1
Plugin 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 1
let g:jedi#auto_initialization = 1
""""""

Plugin 'w0rp/ale'

call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""AESTHETICS"""""""""""""""""""""""""""

" Highlights the cursor position VERY OBVIOUSLY
set cursorline
set cursorcolumn
hi CursorColumn ctermbg=Black
hi CursorLine cterm=None ctermbg=Blue ctermfg=Black
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight CursorLine cterm=Bold ctermbg=LightBlue ctermfg=Black
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight CursorLine cterm=None ctermbg=Blue ctermfg=Black

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" Tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Highlight search
set hlsearch
nnoremap <F3> :noh<CR>
" Scrolling past the line pops you below
set whichwrap+=<,>,h,l,[,]

" Change default split behavior
set splitright
set splitbelow

" Syntax highlighting
filetype on
filetype plugin on
syntax enable

""""""""""""""""""""""""""GENERAL MAPS""""""""""""""""""""""""
noremap x "_x

""""""""""""""""""""""""INSERT MODE MAPS"""""""""""""""""""""

" Press i i to exit insert mode.
imap ii <C-[>
imap II <C-[>

" Save file
imap <C-S> <C-[><C-S>
""""""""""""""""""""""""NORMAL MODE MAPS"""""""""""""""""""""

" <leader> l will highlight the current line.
nnoremap <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Sends things away without overwriting the register
nnoremap <leader>d "_d

" Save with ctrl s
nnoremap <C-S> :w<CR>

" Generate pandoc preview F5 processes and F4 opens
nmap <F5> :!pandoc -o /tmp/vimtemp.pdf % && pkill -HUP mupdf<CR><CR>
nmap <F4> :!mupdf /tmp/vimtemp.pdf &<CR><CR>

" Enters tabs
nnoremap <Tab> i<Tab>

""""""""""""""""""""""SPLIT WINDOWS""""""""""""""""""""""

" For moving split windows
nnoremap <C-W>h <C-W><S-H>
nnoremap <C-W>j <C-W><S-J>
nnoremap <C-W>k <C-W><S-K>
nnoremap <C-W>l <C-W><S-L>
" For moving focus between split windows
nnoremap <C-h> <C-W><C-h>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
" Alows you to do those commands in insert mode
imap <C-w> <C-o><C-w>

"""""""""""""""""""""VISUAL MODE MAPS""""""""""""""""""""""
" Sends things away without overwriting the register
vnoremap <leader>d "_d
vnoremap u ~
