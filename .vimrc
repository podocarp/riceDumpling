"""""""""""""""""""""""""""""FLAGS""""""""""""""""""""""""""
set autoindent
set autowriteall
set colorcolumn=80
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
set termguicolors
set tw=0
set undofile
set viminfo=

"""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"""""""Autocomplete stuff
" Plugin 'Valloric/YouCompleteMe'
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_key_list_select_completion = ['<C-n>']
" let g:ycm_key_list_previous_completion = ['<C-p>']

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""Linting stuff
Plugin 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'c': ['clang'],
\   'cpp': ['clang'],
\   'javascript': ['eslint']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'css': ['prettier'],
\   'javascript': ['prettier'],
\   'java': ['prettier'],
\   'scss': ['prettier'],
\}
let g:ale_c_clang_options='-std=c11 -Wall -pthread'
let g:ale_c_gcc_options='-std=c11 -Wall -lpthread'

nmap <silent> zk <Plug>(ale_previous_wrap)zz
nmap <silent> zj <Plug>(ale_next_wrap)zz
noremap <F1> :ALEFix<CR>
""""""

"""""" Latex
Plugin 'lervag/vimtex', {'for': 'tex'}
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

nnoremap <leader>c :VimtexTocToggle<CR><c-w><c-h>
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
" au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

""""""Misc stuff
Plugin 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
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

Plugin 'wincent/Command-T'
let g:CommandTCursorColor = 'Search'
let g:CommandTHighlightColor = 'Search'

Plugin 'jiangmiao/auto-pairs'
au Filetype tex let b:AutoPairs = {'(':')', '[':']', '{':'}', "$":"$"}
Plugin 'tpope/vim-surround'

Plugin 'ryanoasis/vim-devicons'
Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "",
            \ "Staged"    : "",
            \ "Untracked" : "",
            \ "Renamed"   : "",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "",
            \ "Dirty"     : "",
            \ "Clean"     : "",
            \ 'Ignored'   : '',
            \ "Unknown"   : "?"
            \ }

set statusline+=%F\ %l:%c

Plugin 'morhetz/gruvbox'
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "soft"
let g:gruvbox_invert_indent_guides = 1
""""""
call vundle#end()            " required
filetype plugin indent on    " required
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
