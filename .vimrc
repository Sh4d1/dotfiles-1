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
set relativenumber " turn on relative line numbering as well
set ruler " cursor position info
set history=2000    " more history
set undolevels=5000 " and undolevels
set undofile
set listchars=tab:»·,trail:·,eol:$ " for graphically displaying whitespace
set wildmenu
set shortmess=filnxtToO " less 'press ... to continue' maybe
set showmode
set laststatus=2
set breakindent
set showbreak=⤷\   " backslash to escape extra space
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
set wildignore+=_site                            " jekyll site directory
set virtualedit=block

set backupdir=~/.vim/backup/
set directory=~/.vim/swp/
set undodir=~/.vim/undo/

set iskeyword+=- " better - and essential for css

set cursorline
set textwidth=78
set colorcolumn=+1,+2,+3

" https://robots.thoughtbot.com/faster-grepping-in-vim
" better grep with the silver searcher
set grepprg=ag\ --nogroup\ --nocolor\ --column
set grepformat=%f:%l:%c%m

" match ErrorMsg '\(^\(<\|=\|>\)\{7\}\([^=].\+\)\?$\)\|\(\s\+$\)' " Highlight VCS conflict markers and trailing spaces
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight VCS conflict markers

let mapleader = ","      " the map leader key
let maplocalleader = ","

" better % navigation
runtime macros/matchit.vim


"" Load plugins with vim-plug

call plug#begin('~/.vim/plugged')

" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lervag/vimtex'
" Plug 'tpope/vim-surround'                    " replaced with vim-sandwich
Plug 'machakann/vim-sandwich'
Plug 'tomtom/tcomment_vim'
Plug 'luochen1990/rainbow'
Plug 'danro/rename.vim'
Plug 'ap/vim-css-color'
" Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Valloric/YouCompleteMe'               " too heavy...
Plug 'ternjs/tern_for_vim'                    " javascript autocompleter
Plug 'ervandew/supertab'                      " tab completion
" Plug 'itchyny/lightline.vim'
" Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'davidhalter/jedi-vim'
Plug 'jamessan/vim-gnupg'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'mbbill/undotree'
" Plug 'sjl/gundo.vim'

call plug#end() " add plugins to &runtimepath

"" Keymappings

inoremap <leader>d <C-R>=strftime('%F')<CR>| " insert current iso date
inoremap <S-Tab> <C-V><Tab>| "shift tab to insert real tab
cmap w!! w !sudo tee % >/dev/null| " save even if opened in readonly
nmap <silent> <leader>h :silent :nohlsearch<CR>| " hide highlighting from search
nmap <silent> <leader>s :set nolist!<CR>| " show/hide whitespace
" noremap - $|  " easy access to beginning and end of line
" noremap _ ^|  " ||
noremap k gk| " for scrolling one screen line at a time
noremap j gj| " ||
nnoremap <F3> :set invpaste paste?<CR>| "toggle paste mode in terminal (avoiding autoindent over pasted text)
set pastetoggle=<F3>| " needed to get out of paste mode
nmap <silent> <leader>p :set spell!<CR>
nmap <leader>f 1z=| " for quick fix word spelling
nnoremap <F2> :Rename | " quick rename current file
nnoremap - :silent e <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
nnoremap _ :NERDTreeToggle<CR>
map <C-@> <C-Space>
imap <C-@> <C-Space>
imap <C-Space> <c-x><c-o>

" faster saving files
map <C-s> :wa<CR>

" easy moving between splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" tagbar
nmap <leader>t :TagbarToggle<CR>

" undotree
nmap <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1

" ctrl-p
map <C-Space> :CtrlP<CR>


" shortcut to system clipboard
vnoremap + "+
noremap + "+

" NVIM specific stuff
if has('nvim')
  " double escape to get out of terminal mode
  " (double to allow single esc to go to terminal)
  tnoremap <esc><esc> <c-\><c-n>
endif

"" Plugins options

" solarized
set background=dark
" let g:solarized_contrast = "high"
colorscheme solarized

" Neomake
autocmd! BufEnter,BufWritePost * Neomake
let g:neomake_tex_enabled_makers = ['chktex'] " use chktex by default (lacheck is also available)


" " syntastic
" let g:syntastic_check_on_open=1
" let g:syntastic_enable_signs=1
" " let g:syntastic_cpp_compiler = 'g++'
" let g:syntastic_cpp_compiler_options = ' -Wall -std=c++11 -stdlib=libc++'
" let g:syntastic_always_populate_loc_list = 1
" " let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_wq = 0

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
let g:ctrlp_map = '' " managing it myself
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0


" vim-sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \   {
      \     'buns'    : ['TagInput(1)', 'TagInput(0)'],
      \     'expr'    : 1,
      \     'filetype': ['html'],
      \     'kind'    : ['add', 'replace'],
      \     'action'  : ['add'],
      \     'input'   : ['t'],
      \   },
      \ ]

function! TagInput(is_head) abort
  if a:is_head
    let s:TagLast = input('Tag: ')
    if s:TagLast !=# ''
      let tag = printf('<%s>', s:TagLast)
    else
      throw 'OperatorSandwichCancel'
    endif
  else
    let tag = printf('</%s>', matchstr(s:TagLast, '^\a[^[:blank:]>/]*'))
  endif
  return tag
endfunction


let g:sandwich#recipes += [
      \   {
      \     'buns'    : ['LatexTagInput(1)', 'LatexTagInput(0)'],
      \     'expr'    : 1,
      \     'filetype': ['plaintex', 'tex', 'latex'],
      \     'kind'    : ['add', 'replace'],
      \     'action'  : ['add'],
      \     'input'   : ['t'],
      \   },
      \ ]

function! LatexTagInput(is_head) abort
  if a:is_head
    let s:TagLast = input('Tag: ')
    if s:TagLast !=# ''
      let tag = printf('\%s{', s:TagLast)
    else
      throw 'OperatorSandwichCancel'
    endif
  else
    let tag = '}'
  endif
  return tag
endfunction

let g:sandwich#recipes += [
      \   {
      \     'external': ['it', 'at'],
      \     'noremap' : 1,
      \     'filetype': ['html'],
      \     'input'   : ['t'],
      \   },
      \ ]

" airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'

" custom symbols (avoid problems with powerline fonts not installed)
let g:airline_powerline_fonts=0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '»'
let g:airline_right_alt_sep = '«'
let g:airline_symbols.crypt = 'X'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = 'RO'

" has to be defined later in file than was previously
" to keep transparent background
hi Normal ctermbg=NONE|

" listchars highlighting
hi SpecialKey guibg=red ctermbg=red

" YCM config
let g:ycm_path_to_python_interpreter = "/usr/bin/python"

" supertab config
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-n>") |
  \ endif

" jedi-vim
" let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = ""  | " rely on supertab tab completion for this
let g:jedi#rename_command = "<leader>r"


" NERDtree
let g:NERDTreeCreatePrefix='keepalt silent keepjumps'
" https://github.com/wincent/wincent/blob/master/roles/dotfiles/files/.vim/autoload/autocmds.vim
function! Attempt_select_last_file() abort
  let l:previous=expand('#:t')
  if l:previous != ''
    call search('\v<' . l:previous . '>')
  endif
endfunction
augroup NERDTreeAutocmds
  autocmd!
  autocmd User NERDTreeInit call Attempt_select_last_file()
augroup END

