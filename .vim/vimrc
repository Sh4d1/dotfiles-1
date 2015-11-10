
" saves and auto loads last view of page - buggy
"au BufWinLeave ?* mkview
"au BufWinEnter ?* silent loadview


"doesn't have to be
set nocompatible
filetype off "needed for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" put all vundle plugins here
" and before vundle end

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'


call vundle#end()            " required
filetype plugin indent on    " required

"for local .vimrc
set exrc
set secure

"so don't lose undo history when switching buffers
set hidden

"the map leader key
let mapleader = ","

set incsearch
set hlsearch
set title

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

"autoindenting
set autoindent
set smartindent

" tabs and spacing
set tabstop=4
set shiftwidth=4
set expandtab

"toggle paste mode in terminal (avoiding autoindent over pasted text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"tagbar activation
"nmap <F8> :TagbarToggle<CR>
"for vala support:
"let g:tagbar_ctags_bin = "anjuta-tags"

set spelllang=en_au
set nospell
nmap <silent> <leader>s :set spell!<CR>

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

