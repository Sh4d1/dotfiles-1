" inspiration for some parts found at: 
"  - http://items.sjbach.com/319/configuring-vim-right
"  - https://github.com/timdawborn/dotfiles/blob/master/.vimrc
"  - and others...

" saves and auto loads last view of page - buggy
"au BufWinLeave ?* mkview
"au BufWinEnter ?* silent loadview


"doesn't have to be compatible
set nocompatible
set encoding=utf-8
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
"Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'machakann/vim-sandwich'
Plug 'tomtom/tcomment_vim'
Plug 'luochen1990/rainbow'

" Add plugins to &runtimepath
call plug#end()

" better % navigation
runtime macros/matchit.vim

" better searching
set ignorecase
set smartcase

"for local .vimrc
set exrc
set secure

" Buffer management
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set title

"so don't lose undo history when switching buffers
set hidden

set scrolloff=3
set sidescrolloff=3

" Indentation
set autoindent
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2
set tabstop=2


"allow backspace over indents, etc.
set backspace=indent,eol,start

"the map leader key
let mapleader = ","
let maplocalleader = ","

set incsearch
set hlsearch
set bs=2 " backspace stuff

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.pyc,*.class,*.so           " compiled files
set wildignore+=ve/**,ve-*/**                    " virtualenv folders
set wildignore+=__pycache__                      " Python 3
set wildignore+=.*.sw[opq]                       " vim swap files
set wildmenu
" set wildmode=list:longest

"set syntax highlighting on
syntax on

"shift tab to insert real tab
inoremap <S-Tab> <C-V><Tab>

"turn on line numbering
set number

"cursor position info
set ruler

"more history and undolevels
set history=1000
set undolevels=2000

" hide highlighting from search
nmap <silent> <leader>n :silent :nohlsearch<CR>

" show/hide whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

"proper encryption
set cm=blowfish2

"less hitting the shift key
"nmap ; :

"easy access to beginning and end of line
noremap - $
noremap _ ^
"for scrolling one screen line at a time
noremap k gk
noremap j gj

"to keep transparent background
hi Normal ctermbg=NONE

"colorscheme
set background=dark
colorscheme solarized


set visualbell
set noerrorbells

" less 'press ... to continue'
set shortmess=atI

"toggle paste mode in terminal (avoiding autoindent over pasted text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"spell checking
set spelllang=en_au
set nospell
nmap <silent> <leader>p :set spell!<CR>
" for quick fix word spelling
nmap <leader>f 1z=

" control space style completion
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
    inoremap <Nul> <C-n>
endif

" save even if opened in readonly
cmap w!! w !sudo tee % >/dev/null

" syntastic stuff
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
"let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -Wall -std=c++11 -stdlib=libc++'

" insert current iso date
inoremap <leader>d <C-R>=strftime('%F')<CR>

let g:vimtex_latexmk_options = '-pdflatex="xelatex --shell-escape" -pdf'

" rainbow plugin
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" Ctrl-P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|ve$\|ve-\|doc/html',
  \ 'file': '\.o$\|\.so$\|\.dll$',
  \ }
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']  " Make Ctrl-P plugin a lot faster for Git projects

