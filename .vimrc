" Samuel Walladge's vimrc
" inspiration for some parts found at:
"  - http://items.sjbach.com/319/configuring-vim-right
"  - https://github.com/timdawborn/dotfiles/blob/master/.vimrc
"  - https://github.com/wincent/wincent/tree/master/roles/dotfiles/files/.vim
"  - and others...


" Load plugins with vim-plug

call plug#begin('~/.vim/plugged')

Plug 'benekastah/neomake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'machakann/vim-sandwich'
Plug 'tomtom/tcomment_vim'
Plug 'danro/rename.vim'
Plug 'ap/vim-css-color'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}       " javascript autocompleter
Plug 'ajh17/VimCompletesMe'                   " minimal context completion
Plug 'majutsushi/tagbar'
Plug 'davidhalter/jedi-vim'

" for editing pgp encrypted files seamlessly
Plug 'jamessan/vim-gnupg'

" better netrw alternative
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" git integrations
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" completions
Plug 'artur-shaik/vim-javacomplete2'

Plug 'mbbill/undotree'
Plug 'benmills/vimux'
Plug 'wannesm/wmgraphviz.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'luochen1990/rainbow'

" solarized colorscheme
Plug 'romainl/flattened'

call plug#end() " add plugins to &runtimepath

"" Settings

set encoding=utf-8 " good default
filetype plugin indent on
syntax on "set syntax highlighting on
set exrc " for local .vimrc
set secure
set title
set hidden "so don't lose undo history when switching buffers

" see more lines on scrolling
set scrolloff=3
set sidescrolloff=3

" indenting
set autoindent
set smarttab
set expandtab
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
set breakindent
set showbreak=⤷
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
set textwidth=80
set colorcolumn=+1,+2,+3

" https://robots.thoughtbot.com/faster-grepping-in-vim
" better grep with the silver searcher
set grepprg=ag\ --vimgrep
set grepformat=%f:%l:%c%m

" match ErrorMsg '\(^\(<\|=\|>\)\{7\}\([^=].\+\)\?$\)\|\(\s\+$\)' " Highlight VCS conflict markers and trailing spaces
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight VCS conflict markers

let mapleader = ","      " the map leader key
let maplocalleader = ","

" better % navigation
runtime macros/matchit.vim

colorscheme flattened_dark

" statusline highlights
hi User1 ctermbg=NONE ctermfg=NONE
hi User2 ctermbg=2 ctermfg=0
hi User3 ctermbg=3 ctermfg=0
hi User4 ctermbg=4 ctermfg=0
hi User5 ctermbg=5 ctermfg=0
hi User6 ctermbg=6 ctermfg=0

" Status Line
set laststatus=2

function! BuildStatusline()
  let l:line='%3*'
  let l:line = l:line . '%2.{mode()}'           " mode
  let l:line = l:line . ' %1* '
  let l:line = l:line . '%F'                    " filename
  let l:line = l:line . '%r%m%w%q%h'            " flags

  let l:line = l:line . '%1*'
  let l:line = l:line . '%='                    " separator

  let l:line = l:line . '%{tagbar#currenttag("%s « ", "", "fs")}'  " tagbar
  let l:line = l:line . '%{&ft}'                " filetype
  let l:line = l:line . ' %2* '
  let l:line = l:line . '%([%{&fenc}]%)%{&ff}'  " encodings
  let l:line = l:line . ' %4* '
  let l:line = l:line . '%v,%l/%L [%p%%] '      " cursor position

  " git status
  let l:line = l:line . '%6*%( %{fugitive#statusline()} %)'
  let l:hunks = GitGutterGetHunkSummary()
  if hunks[0] || hunks[1] || hunks[2]
    let l:line = l:line . '%#GitGutterAdd# +' . l:hunks[0] .
                        \ ' %#GitGutterChange#~' . l:hunks[1] .
                        \ ' %#GitGutterDelete#-' . l:hunks[2] . ' '
  endif

  return line
endfunction

set statusline=%!BuildStatusline()


"" Keymappings

inoremap <leader>d <C-R>=strftime('%F')<CR>| " insert current iso date
" inoremap <S-Tab> <C-V><Tab>| "shift tab to insert real tab
cmap w!! w !sudo tee % >/dev/null| " save even if opened in readonly

" hide search highlighting
nnoremap <silent> <esc> :silent :nohlsearch<CR>

nmap <silent> <leader>s :set nolist!<CR>| " show/hide whitespace
" noremap - $|  " easy access to beginning and end of line
" noremap _ ^|  " ||
" noremap k gk| " for scrolling one screen line at a time
" noremap j gj| " ||
nnoremap <F3> :set invpaste paste?<CR>| "toggle paste mode in terminal (avoiding autoindent over pasted text)
set pastetoggle=<F3>| " needed to get out of paste mode
nmap <silent> <leader>p :set spell!<CR>
nmap <leader>f 1z=| " for quick fix word spelling
nnoremap <F2> :Rename | " quick rename current file
nnoremap - :silent e <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
nnoremap <silent> _ :NERDTreeToggle<CR>
map <C-@> <C-Space>
imap <C-@> <C-Space>
imap <C-Space> <c-x><c-o>

nnoremap / /\v
vnoremap / /\v

" faster saving files
map <silent> <C-s> :wa<CR>

" easy moving between splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" tagbar
nmap <silent> <leader>t :TagbarToggle<CR>

" undotree
nmap <silent> <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1

" ctrl-p
map <silent> <C-Space> :CtrlP<CR>


" Vimux
function! VimuxSlime()
 call VimuxSendText(@v)
 call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <C-c><C-c> "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <C-c><C-c> vip<C-c><C-c>

" map <Leader>bp :call VimuxRunCommand("python")<CR>

" Prompt for a command to run
map <Leader>bp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>bl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>bo :call VimuxOpenRunner()<CR>

" Inspect runner pane
map <Leader>bi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>bq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>bx :VimuxInterruptRunner<CR>
" send eof
map <Leader>bd :call VimuxSendKeys("^D")<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>bz :call VimuxZoomRunner()<CR>


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
let g:vimtex_view_general_viewer = 'rifle'

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

" " airline config
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme = 'solarized'
"
" " custom symbols (avoid problems with powerline fonts not installed)
" let g:airline_powerline_fonts=0
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_alt_sep = '»'
" let g:airline_right_alt_sep = '«'
" let g:airline_symbols.crypt = 'X'
" " let g:airline_symbols.linenr = '␊'
" " let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" " let g:airline_symbols.paste = 'Þ'
" " let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = '∄'
" let g:airline_symbols.whitespace = 'Ξ'
" let g:airline_symbols.readonly = 'RO'


" has to be defined later in file than was previously
" to keep transparent background
hi Normal ctermbg=NONE|

" listchars highlighting
hi SpecialKey guibg=red ctermbg=red

" vimcompletesme config
let g:vcm_default_maps = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger=""


" jedi-vim
" let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
" already have other keybindings for omnicompletion
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>r"


let g:WMGraphviz_viewer = 'rifle'

