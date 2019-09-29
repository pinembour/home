"" General
set number relativenumber	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

"" Advanced
set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set undofile
set backspace=indent,eol,start	" Backspace behaviour
set splitright	"Split with new buffer on the right
set splitbelow "Split with new buffer below

call plug#begin('~/.local/share/nvim/plugged')
"Colors :
Plug 'dylanaraps/wal.vim'

"Completion :
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"Shows git status in left bar
Plug 'airblade/vim-gitgutter'

"Terminal upgrade
Plug 'vimlab/split-term.vim'

"Tags
"Plug 'ludovicchabant/vim-gutentags'

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
call plug#end()

let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

colorscheme wal

