"" General
set nocompatible              " be iMproved, required
set history=1000
set showcmd                 " show incomplete commands
set number relativenumber	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set showmatch               " show matching brackets
set ignorecase	" Always case-insensitive
set wrapscan                " wrap search
set gdefault                " assume /g flag on :s/
set incsearch	" Searches for strings incrementally

if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
		set clipboard=unnamed,unnamedplus
	else         " On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif

let mapleader= ','

set formatoptions+=o  
set conceallevel=1
set termguicolors
set background=dark
set nojoinspaces 

" SPELLCHECK
set spell spelllang=fr
set spell spelllang=en_us
set nospell
map <silent> <F8> :set spell!<CR>

" BACKUP
set nobackup                " no backup : everything is on git/svn
set nowb
set noswapfile              " I said everything was on git !

" ENCODING
set encoding=utf-8
set fileencoding=utf-8

set autoindent	" Auto-indent new lines
set smarttab	" Enable smart-tabs
set smartindent	" Enable smart-indent
set shiftwidth=4	" Number of auto-indent spaces
set tabstop=4             " how many spaces on tab
set softtabstop=4	" Number of spaces per Tab
syntax on

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set ttyfast                 " smooth !
cmap w!! w !sudo tee > /dev/null % 

"autocmd BufEnter * lcd %:p:h

"SYNTAX/LAYOUT
filetype plugin indent on   " automatic recognition of filetype
set wrap                    " wrap


" Relative numbering

function! NumberToggle()
	if(&relativenumber == 1)
		set nornu
		set number
	else
		set rnu
	endif
endfunc

call NumberToggle()

" Toggle between normal and relative numbering.
nnoremap <F4> :call NumberToggle()<cr>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

let g:javascript_plugin_jsdoc           = 1
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_arrow_function = "⇒"
let g:javascript_conceal_return         = "⇚"

let g:jsx_ext_required = 0

let g:syntastic_check_on_open=1

map <C-E> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']

let g:ycm_autoclose_preview_window_after_completion=1

"FOLDING
set foldmethod=indent
set foldlevel=99

au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx


"" Advanced
set ruler	" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set undofile
set undodir=~/.config/nvim/undodir
set backspace=indent,eol,start	" Backspace behaviour
set splitright	"Split with new buffer on the right
set splitbelow "Split with new buffer below

call plug#begin('~/.local/share/nvim/plugged')
"Colors :
Plug 'dylanaraps/wal.vim'

"Completion :
Plug 'ycm-core/YouCompleteMe'
" { 'do': './install.py --use-clangd' }

"Shows git status in left bar
Plug 'airblade/vim-gitgutter'

"Themes
Plug 'flrnd/candid.vim'
Plug 'gilgigilgil/anderson.vim'

"Terminal upgrade
Plug 'vimlab/split-term.vim'

"Seemlessly move between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

"Tags
"Plug 'ludovicchabant/vim-gutentags'

"Automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

"Speed up Vim by updating folds only when called-for.
Plug 'Konfekt/FastFold'

"Markdown
Plug 'tpope/vim-markdown'

"Latex
Plug 'lervag/vimtex'

"NerdTree
Plug 'scrooloose/nerdtree'

"Bottom Bar
Plug 'vim-airline/vim-airline'

"Snips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Templates
Plug 'tibabit/vim-templates'

"Nginx
Plug 'vim-scripts/nginx.vim'
call plug#end()

let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:lightline = { 'colorscheme': 'candid' }

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
colorscheme candid
