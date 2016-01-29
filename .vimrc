" Samuel Walladge's vimrc
" inspiration for some parts found at: 
"  - http://items.sjbach.com/319/configuring-vim-right
"  - https://github.com/timdawborn/dotfiles/blob/master/.vimrc
"  - and others...

"" Settings

set nocompatible " doesn't have to be compatible
set encoding=utf-8 " good default
filetype plugin indent on
syntax on "set syntax highlighting on
set exrc " for local .vimrc
set secure
set title
set hidden "so don't lose undo history when switching buffers
set scrolloff=3 " see more lines on scrolling
set sidescrolloff=3
set autoindent
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set ignorecase " better searching
set smartcase
set incsearch
set hlsearch
set bs=2 " backspace stuff
set backspace=indent,eol,start " allow backspace over indents, etc.
set number " turn on line numbering
set ruler " cursor position info
set history=1000    " more history
set undolevels=2000 " and undolevels
set cm=blowfish2 " proper encryption
set listchars=tab:>-,trail:·,eol:$ " for graphically displaying whitespace
set wildmenu
set shortmess=filnxtToO " less 'press ... to continue' maybe
set showmode
" set wildmode=list:longest| " no, i like the vim way
set nospell " spellchecking off by default
set spelllang=en_au " correct language
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.pyc,*.class,*.so           " compiled files
set wildignore+=ve/**,ve-*/**                    " virtualenv folders
set wildignore+=__pycache__                      " Python 3
set wildignore+=.*.sw[opq]                       " vim swap files
set virtualedit=block

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight VCS conflict markers
hi Normal ctermbg=NONE| "to keep transparent background

let mapleader = ","      " the map leader key
let maplocalleader = ","

" better % navigation
runtime macros/matchit.vim


"" Load plugins with vim-plug

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'machakann/vim-sandwich'
Plug 'tomtom/tcomment_vim'
Plug 'luochen1990/rainbow'
Plug 'danro/rename.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-surround'

call plug#end() " add plugins to &runtimepath


"" Keymappings

nmap <C-h> :bp<CR>| " Buffer management
nmap <C-l> :bn<CR>| " - easy move through buffers
inoremap <leader>d <C-R>=strftime('%F')<CR>| " insert current iso date
inoremap <S-Tab> <C-V><Tab>| "shift tab to insert real tab
cmap w!! w !sudo tee % >/dev/null| " save even if opened in readonly
nmap <silent> <leader>n :silent :nohlsearch<CR>| " hide highlighting from search
nmap <silent> <leader>s :set nolist!<CR>| " show/hide whitespace
noremap - $|  " easy access to beginning and end of line
noremap _ ^|  " ||
noremap k gk| " for scrolling one screen line at a time
noremap j gj| " ||
nnoremap <F3> :set invpaste paste?<CR>| "toggle paste mode in terminal (avoiding autoindent over pasted text)
set pastetoggle=<F3>| " needed to get out of paste mode
nmap <silent> <leader>p :set spell!<CR>
nmap <leader>f 1z=| " for quick fix word spelling
nnoremap <F2> :Rename | " quick rename current file

" control space style completion - TODO: better completion shortcuts
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
    inoremap <Nul> <C-n>
endif


"" Plugins options

" solarized
set background=dark
colorscheme solarized

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
" let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -Wall -std=c++11 -stdlib=libc++'

" vimtex
let g:vimtex_latexmk_options = '-pdflatex="xelatex --shell-escape" -pdf'

" rainbow 
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

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|ve$\|ve-\|doc/html',
  \ 'file': '\.o$\|\.so$\|\.dll$',
  \ }

