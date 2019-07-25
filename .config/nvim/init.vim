set runtimepath^=~/.vim runtimepath+=~/.vim/after
let $packpath = $runtimepath

" enable word wrapping bitch
set formatoptions=l
set lbr
set undofile
" enable line number
set number relativenumber

" Use markdown for wiki markup
let g:vimwiki_list = [{'path': '~/vimwiki/',
		     \ 'syntax': 'markdown', 'ext': '.md'}]
syntax on

" spellcheck to f6
map <F6> :setlocal spell! spelllang-en_us<CR>



" neovim remote servername
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_callback_hooks = ['MyTestHook']
function! MyTestHook(status)
	echom a:status
endfunction

let g:vimtex_view_general_viewer = 'zathura'
let g:tex_flavor = "latex"
" Navigation with guides taken from luke smith
inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
	map <Tab><Tab> <Esc>/<++><Enter>"_c4l

" autocomplete the fucking parenthesis and curly shit automatically
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" escape with autocompleted parenthesis 
inoremap ;; <right><ESC>a


" LATEX snippets
autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space>main.tex%<Enter>a

" R snippets
autocmd FileType r inoremap ;p %>%<Esc>a<Space>


" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline' 
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/jalvesaq/Nvim-R.git'
Plug 'gaalcaras/ncm-R'
"Plug 'sirver/UltiSnips'
Plug 'lervag/vimtex'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-ultisnips'
"Plug 'ncm2/syntax'
" pywal theme
Plug 'dylanaraps/wal.vim'

"Plug 'autozimu/LanguageClient-neovim', {
"			\ 'branch' : 'next',
"			\ 'do' : 'bash install.sh',
"			\ }
"Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

" Use deoplete
let g:deoplete#enable_at_startup = 1
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
"set shortmess+=c
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
"   inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"au User Ncm2Plugin call ncm2#register_source({
"        \ 'name' : 'css',
"        \ 'priority': 9, 
"        \ 'subscope_enable': 1,
"        \ 'scope': ['css','scss'],
"        \ 'mark': 'css',
"        \ 'word_pattern': '[\w\-]+',
"        \ 'complete_pattern': ':\s*',
"        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"        \ })

colorscheme wal

