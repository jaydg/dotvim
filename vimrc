" Vimrc file

set nocompatible    " use vim defaults
set bs=indent,eol,start " allow backspacing over everything in insert mode
set ls=2            " allways show status line
set history=50      " keep 50 lines of command line history
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching
"set noignorecase   " don't ignore case
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
"set autochdir       " change directory
set sm              " show matching braces, somewhat annoying...
syntax on           " syntax highlighing

" Highlight current line number
set cursorline
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

set wildignore+=*.o,*.pyc,*.bak,*.class
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.*

" pathogen plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

if has("gui_running")
  " See ~/.gvimrc
  if has("gui_macvim")
    set guifont=IBM\ Plex\ Mono:h18
  else
    set guifont=Monospace\ 10
  endif
  set lines=50              " height = 50 lines
  set columns=100           " width = 100 columns
  set background=light      " adapt colors for background
  set selectmode=mouse,key,cmd
  set keymodel=
else
  colorscheme one    " use this color scheme
  " set background=dark        " adapt colors for background
endif

filetype indent on
filetype plugin on    " Enable filetype-specific plugins

" Use a small tab stop and shift width for the following file types.
autocmd FileType ruby,lua,vim setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4

" Automatically remove all trailing whitespace before writing
autocmd BufWritePre * :%s/\s\+$//e

" Lower the default updatetime of 4 seconds
set updatetime=100

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
au CursorHold * if getcmdwintype() == '' | checktime  | endif

" --- Lightline _______________________----------
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ],
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
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

" --- NERDTree ----------------------------------
" How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeIgnore=['\.pyc$', '\.o$', '\~$']

" --- indent-guides -----------------------------
let g:indent_guides_enable_on_vim_startup = 1

" --- ctrlp.vim ---------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" --- tagbar --------------------------
nmap <F8> :TagbarToggle<CR>

" --- ale -----------------------------
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
