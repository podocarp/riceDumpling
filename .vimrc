"""""""""""""""""""""""GENERAL STUFF""""""""""""""""""""""""""
set mouse=a
set path+=**
set number relativenumber
set ruler
set nobackup
set ignorecase
set linebreak
set nocompatible
set viminfo=
set showcmd
set lazyredraw
set autoindent
set noswapfile
set statusline+=%F\ %l\:%c
set colorcolumn=80
"""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"""""""Autocomplete stuff
Plugin 'lifepillar/vim-mucomplete'
set completeopt-=preview
set completeopt+=menuone,noselect
set shortmess+=c
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

Plugin 'davidhalter/jedi-vim', {'for': 'python'}
let g:jedi#popup_on_dot = 1
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0


Plugin 'justmao945/vim-clang'
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

""""""Linting stuff
Plugin 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'

Plugin 'Chiel92/vim-autoformat'
noremap <F1> :Autoformat<CR>
let g:formatdef_autopep8 = '"autopep8 -aa -"'
let g:formatters_python = ['autopep8']
""""""

"""""" Latex
Plugin 'vim-latex/vim-latex'
" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_ViewRule_dvi = 'okular'

""""""Misc stuff
Plugin 'scrooloose/nerdtree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

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
Plugin 'godlygeek/tabular' 	"required by vim markdown
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

Plugin 'dylanaraps/wal.vim'
""""""

call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""AESTHETICS"""""""""""""""""""""""""""
colorscheme wal

" Highlights the cursor position VERY OBVIOUSLY
set cursorline
set cursorcolumn
hi CursorColumn ctermbg=Gray
" Change Color when entering Insert Mode
autocmd InsertEnter * hi CursorLine cterm=Bold ctermbg=LightBlue ctermfg=Black
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * hi CursorLine cterm=None ctermbg=DarkMagenta ctermfg=Black

augroup BgHighlight
	autocmd!
	autocmd WinEnter * set cul
	autocmd WinEnter * hi StatusLine cterm=Bold ctermbg=Yellow ctermfg=Black
	autocmd WinLeave * set nocul
	autocmd WinLeave * hi StatusLine cterm=None ctermbg=Gray ctermfg=Gray
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
set splitbelow

" Syntax highlighting
filetype on
filetype plugin on
syntax enable

" File picker
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_winsize = 20


""""""""""""""""""""""""""GENERAL MAPS""""""""""""""""""""""""
" Scroll in wrapped lines
map <Up> gk
map <Down> gj
""""""""""""""""""""""""INSERT MODE MAPS"""""""""""""""""""""

" Press i i to exit insert mode.
imap ij <C-[>

" Save file
imap <C-S> <C-[><C-S>

" paste
inoremap <C-v> <ESC>"+pa

""""""""""""""""""""""""NORMAL MODE MAPS"""""""""""""""""""""

" Sends things away without overwriting the register
nnoremap <leader>d "_d

" Save with ctrl s
nnoremap <C-S> :w<CR>

" Ctags
nnoremap <F2> :!ctags -R .

" Remove search highlights
nnoremap <F3> :noh<CR>

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

" Move selected blocks up and down
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

vnoremap <C-c> "+y
vnoremap <C-x> "+d
