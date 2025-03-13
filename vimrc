" Vimrc file

set nocompatible    " use vim defaults
set bs=indent,eol,start " allow backspacing over everything in insert mode
set ls=2            " allways show status line
set history=50      " keep 50 lines of command line history
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set noshowmode      " don't show mode change, lighline does that
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching
set title           " show title in console title bar
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files

set autoindent      " always set autoindenting on
set smartindent     " smart indent
set cindent         " cindent
set wildmenu        " display all choices
syntax on           " syntax highlighing

" Redefine leader key to space
let mapleader=" "
"nnoremap <SPACE> <Nop>

" Start plugin confiuration
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/w0rp/ale.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/dyng/ctrlsf.vim.git'
Plug 'https://github.com/davidhalter/jedi-vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/luochen1990/rainbow.git'
Plug 'https://github.com/maximbaz/lightline-ale'
Plug 'https://github.com/tpope/vim-sleuth.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/tpope/vim-obsession.git'
Plug 'https://github.com/vim-scripts/TaskList.vim.git'
Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/jez/vim-superman'
" Git integration
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/junegunn/gv.vim'
" File type support
Plug 'pearofducks/ansible-vim'
Plug 'https://github.com/idanarye/vim-dutyl', { 'for': 'd' }
Plug 'https://github.com/elzr/vim-json', { 'for': 'json' }
Plug 'https://github.com/preservim/vim-markdown', { 'for': 'markdown' }
Plug 'https://github.com/cespare/vim-toml', { 'branch': 'main', 'for': 'toml' }
Plug 'https://github.com/rhysd/vim-crystal.git', { 'for': 'crystal' }
Plug 'https://github.com/python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'https://github.com/jvirtanen/vim-hcl.git', { 'for': 'terraform' }

" Initialize plugin system
call plug#end()

" Highlight current line number
set cursorline
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

set wildignore+=*.o,*.pyc,*.bak,*.class
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.*

" keep swapfiles out of working directories
" https://stackoverflow.com/questions/1636297
:set directory=$HOME/.vim/swapfiles//

" Change buffers quickly
" https://stackoverflow.com/questions/5559029
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Disable key to switch to Ex mode
:nnoremap Q <Nop>

" Enable task list
map <F7> :TaskList<CR>

" Enable Rainbow Parentheses Improved
let g:rainbow_active = 1

" Enable system clipboard
" https://vim.fandom.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus

" Enable full mouse support whenever the clipboard is supported
if has("clipboard")
  set mouse=a
endif

if has("gui_running")
  " See ~/.gvimrc
  set guifont=Monospace\ 10
  set lines=50              " height = 50 lines
  set columns=100           " width = 100 columns
  set selectmode=mouse,key,cmd
  set background=light      " adapt colors for background
  set keymodel=
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  colorscheme slate
else
  colorscheme industry
endif

filetype indent on
filetype plugin on    " Enable filetype-specific plugins

" Enable true color mode if the terminal supports it
if (has("termguicolors"))
  set termguicolors
endif

" Automatically remove all trailing whitespace before writing
autocmd BufWritePre * :%s/\s\+$//e

" Lower the default updatetime of 4 seconds
set updatetime=100

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
au CursorHold * if getcmdwintype() == '' | checktime  | endif

" --- Lightline _______________________----------
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'obsession' ],
      \             [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ],
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
      \ },
      \ 'component_function': {
      \   'obsession': 'ObsessionStatus',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }
function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  return lightline#statusline(0)
endfunction
function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'
function! TagbarStatusFunc(current, sort, fname, ...) abort
  return lightline#statusline(0)
endfunction

" --- NERDTree ----------------------------------
nnoremap <C-n> :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let NERDTreeRespectWildIgnore = 1

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" --- indent-guides -----------------------------
let g:indent_guides_enable_on_vim_startup = 1

" --- ctrlp.vim ---------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" --- ctrlsf.vim --------------------------------
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" --- tagbar --------------------------
nmap <F8> :TagbarToggle<CR>

" --- ale -----------------------------
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" --- superman ------------------------
noremap K :SuperMan <cword><CR>
