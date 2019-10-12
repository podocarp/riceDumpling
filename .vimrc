"""""""""""""""""""""""""""""FLAGS""""""""""""""""""""""""""
set path+=**
set mouse=a
set number relativenumber
set ruler
set nobackup
set linebreak
set viminfo=
set showcmd
set lazyredraw
set autoindent
set statusline+=%F\ %l:%c
set colorcolumn=80
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autowriteall
set undofile
set nocursorline

"""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"""""""Autocomplete stuff
Plugin 'lifepillar/vim-mucomplete'
set completeopt+=menuone,preview,noselect
set complete-=u
set complete-=t
set complete-=i
set shortmess+=c
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 500
let g:mucomplete#reopen_immediately = 1
let g:mucomplete#cycle_with_trigger = 1

Plugin 'davidhalter/jedi-vim', {'for': 'python'}
let g:jedi#popup_on_dot = 1
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Trigger configuration.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""Linting stuff
Plugin 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'scss': ['prettier'],
\   'css': ['prettier'],
\   'java': ['prettier'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

nmap <silent> zk <Plug>(ale_previous_wrap)
nmap <silent> zj <Plug>(ale_next_wrap)
noremap <F1> :ALEFix<CR>
""""""

"""""" Latex
Plugin 'lervag/vimtex', {'for': 'tex'}
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : '',
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
Plugin 'godlygeek/tabular'      "required by vim markdown
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

Plugin 'morhetz/gruvbox'
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "hard"
""""""
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""AESTHETICS""""""""""""""""""""""
" Colorscheme
colorscheme gruvbox

" Disable neovim insert mode bar cursor
set guicursor=

" Show currently focused buffer
augroup BgHighlight
    autocmd WinEnter * set cul
    autocmd WinEnter * hi StatusLine cterm=Bold,reverse
    autocmd WinLeave * set nocul
    autocmd WinLeave * hi StatusLine cterm=None
augroup END

" Tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Highlight search
set hlsearch

" Scrolling past the line pops you below
set whichwrap+=<,>,h,l,[,]

" Change default split behavior
set splitright

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
""""""""""""""""""""""""INSERT MODE MAPS"""""""""""""""""""

" paste
inoremap <C-v> <ESC>"+pa

""""""""""""""""""""""""NORMAL MODE MAPS"""""""""""""""""""

" Sends things away without overwriting the register
nnoremap <leader>d "_d

" Open shell (this breaks in vanilla vim)
nnoremap <C-S> :sp<CR>:term<CR>A

" Ctags
nnoremap <F2> :!ctags -R .

" Remove search highlights
nnoremap <F3> :noh<CR>

" Enters tabs
nnoremap <Tab> 0i<Tab>

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
" Alows you to do those commands in insert mode
imap <C-w> <C-o><C-w>

"""""""""""""""""""""VISUAL MODE MAPS""""""""""""""""""""""
" Sends things away without overwriting the register
vnoremap <leader>d "_d

" Move selected blocks up and down
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

vnoremap <C-c> "+y
vnoremap <C-x> "+d
