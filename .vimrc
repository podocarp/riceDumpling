"""""""""""""""""""""""""""""FLAGS""""""""""""""""""""""""""
set autoindent
set autowriteall
set colorcolumn=80
set cursorline
set expandtab
set ignorecase
set incsearch
set lazyredraw
set linebreak
set list
set mouse=a
set nobackup
set nocursorline
set noshowcmd
set nowrapscan
set number relativenumber
set path+=**
set ruler
set scrolloff=4
set shiftwidth=4
set showcmd
set smartcase
set smartindent
set smarttab
set splitright
set tw=0
set undofile
set viminfo=

"""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""
call plug#begin(stdpath('data') . '/bundle')

""""""" Autocomplete and syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""Linting stuff
" Plug 'w0rp/ale'
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_linters = {
" \   'c': ['clang'],
" \   'cpp': ['clang'],
" \   'javascript': ['eslint']
" \}
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'c': ['clang-format'],
" \   'cpp': ['clang-format'],
" \   'css': ['prettier'],
" \   'javascript': ['prettier'],
" \   'java': ['prettier'],
" \   'scss': ['prettier'],
" \}
" let g:ale_c_clang_options='-std=c11 -Wall -pthread'
" let g:ale_c_gcc_options='-std=c11 -Wall -lpthread'
" 
" nmap <silent> zk <Plug>(ale_previous_wrap)zz
" nmap <silent> zj <Plug>(ale_next_wrap)zz
" noremap <F1> :ALEFix<CR>
""""""

"""""" Latex
Plug 'lervag/vimtex', {'for': 'tex'}
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : expand('%:r') . "_latexmk",
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \   '-pdf',
    \ ],
    \}

Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
let g:tex_conceal="abdgm"
set conceallevel=2

nnoremap <leader>c :VimtexTocToggle<CR><c-w><c-h>

""""""Misc stuff
Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
" Open NERDTree if no file specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree if opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

Plug 'wincent/Command-T'
let g:CommandTCursorColor = 'Search'
let g:CommandTHighlightColor = 'Search'

Plug 'tpope/vim-surround'

Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeShowIgnoredStatus = 1

set statusline+=%F\ %l:%c

Plug 'morhetz/gruvbox'
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "soft"
let g:gruvbox_invert_indent_guides = 1
""""""
call plug#end()
"""""""""""""""""""""""""""AESTHETICS""""""""""""""""""""""
" Colorscheme
colorscheme gruvbox

" Disable neovim insert mode bar cursor
set guicursor=

" Tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Highlight search
set hlsearch

" Scrolling past the line pops you below
set whichwrap+=<,>,h,l,[,]

" Syntax highlighting
syntax enable

" No line numbers in terminal (this breaks in vanilla vim)
autocmd TermOpen * setlocal nonumber norelativenumber

" File picker
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_winsize = 20

"""""""File Extension defaults
augroup MDProj
    au!
    autocmd BufRead,BufNewFile *.md set tw=80
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
augroup END

augroup texProj
    au!
    autocmd BufRead,BufNewFile *.tex set tw=80
    autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_gb
augroup END

augroup CProj
    au!
    autocmd BufRead,BufNewFile *.c,*.cpp,*.h set cindent shiftwidth=8
augroup END

augroup JSProj
    au!
    autocmd BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx set filetype=javascript
    autocmd BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx set softtabstop=2 shiftwidth=2
augroup END
""""""""""""""""""""""""""GENERAL MAPS"""""""""""""""""""""
" Scroll in wrapped lines
map <Up> gk
map <Down> gj
map <Esc><Esc> :w<CR>
""""""""""""""""""""""""INSERT MODE MAPS"""""""""""""""""""

" paste
inoremap <C-v> <ESC>"+pa

""""""""""""""""""""""""NORMAL MODE MAPS"""""""""""""""""""

" Sends things away without overwriting the register
nnoremap <leader>d "_d

" Open shell (this breaks in vanilla vim)
nnoremap <C-S> :sp<CR>:term<CR>A

" Remove search highlights
nnoremap <F3> :noh<CR>

""""""""""""""""""""""SPLIT WINDOWS""""""""""""""""""""""""

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

"""""""""""""""""""""VISUAL MODE MAPS""""""""""""""""""""""
" Sends things away without overwriting the register
vnoremap <leader>d "_d

" Move selected blocks up and down
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

vnoremap <C-c> "+y
vnoremap <C-x> "+d

""""""""""""""""""""""""""""MISC""""""""""""""""""""""""""
