" Samuel Walladge's vimrc
" inspiration for some parts found at:
"  - http://items.sjbach.com/319/configuring-vim-right
"  - https://github.com/timdawborn/dotfiles/blob/master/.vimrc
"  - https://github.com/wincent/wincent/tree/master/roles/dotfiles/files/.vim
"  - https://www.vi-improved.org/{recommendations,plugins}
"  - and others...


" Load plugins with vim-plug
call plug#begin('~/.vim/plugged')

                                                                          " Misc
Plug 'tpope/vim-repeat'                                                   " better repeating for supported plugins
Plug 'tomtom/tcomment_vim'                                                " commenting
Plug 'danro/rename.vim'                                                   " easy rename files from vim
Plug 'tpope/vim-speeddating'                                              " make inc/dec numbers work with dates
Plug 'tpope/vim-surround'                                                 " edit surrounding things
Plug 'tommcdo/vim-lion'                                                   " align things
Plug 'AndrewRadev/sideways.vim'                                           " move function args sideways
Plug 'rstacruz/sparkup', {'rtp': 'vim'}                                   " quick insert html tags
Plug 'justinmk/vim-sneak'                                                 " alternative to f/t
Plug 'jamessan/vim-gnupg'                                                 " seamless editing pgp encrypted files

                                                                          " Language help
Plug 'lervag/vimtex'                                                      " latex
Plug 'wannesm/wmgraphviz.vim'                                             " graphviz dot

                                                                          " Tags
Plug 'ludovicchabant/vim-gutentags'                                       " auto-generate tags file
Plug 'majutsushi/tagbar'                                                  " view tags easily


                                                                          " Git integrations
Plug 'tpope/vim-fugitive'                                                 " git integration
Plug 'airblade/vim-gitgutter'                                             " view hunks/changes in the gutter
Plug 'jreybert/vimagit'                                                   " interactive git stage/view/commit window

                                                                          " Completions
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}                     " java completion
Plug 'davidhalter/jedi-vim', {'for': 'python'}                            " python completions + refactoring
Plug 'ternjs/tern_for_vim', {'do': 'npm install', 'for': 'javascript'}    " javascript completions

                                                                          " Utilities
Plug 'ctrlpvim/ctrlp.vim'                                                 " fuzzy finder
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                          " show the undotree
Plug 'benmills/vimux'                                                     " run things in tmux
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'                       " snippets
Plug 'neomake/neomake'                                                    " async make + gutter signs
Plug 'ajh17/VimCompletesMe'                                               " tab completion

                                                                          " Pretty
Plug 'luochen1990/rainbow'                                                " easier to see nested parens
Plug 'ap/vim-css-color'                                                   " highlight colors in css
Plug 'romainl/flattened'                                                  " (solarized)

" add plugins to &runtimepath
call plug#end()


" set options

set encoding=utf-8 " good default
filetype plugin indent on
syntax on "set syntax highlighting on
set exrc " for local .vimrc
set secure
set title
set hidden " so don't lose undo history when switching buffers

" see more lines on scrolling
set scrolloff=3
set sidescrolloff=3

" indenting
set autoindent
set smarttab
set expandtab
set softtabstop=2
set shiftwidth=2

" better search behaviour
set tabstop=2
set ignorecase
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
set wildignore+=*.pdf                            " compiled docs

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

let mapleader = "\<space>"
let maplocalleader = "\<space>"

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
  let l:line = '%3*'
  let l:line .= '%2.{mode()}'                                    " current mode
  let l:line .= ' %1* '
  let l:line .= '%F'                                             " filename
  let l:line .= '%r%m%w%q%h'                                     " flags

  let l:line .= '%1*'
  let l:line .= '%='                                             " separator

  let l:line .= ' %{tagbar#currenttag(''%s « '', '''', ''fs'')}'  " tagbar
  let l:line .= '%{&ft}'                                         " filetype
  let l:line .= ' %2* '
  let l:line .= '%([%{&fenc}]%)%{&ff}'                           " encodings
  let l:line .= ' %4* '
  let l:line .= '%v,%l/%L [%p%%] '                               " cursor

  " git status
  let l:line .= '%6*%( %{fugitive#statusline()} %)'
  let l:hunks = GitGutterGetHunkSummary()
  if l:hunks[0] || l:hunks[1] || l:hunks[2]
    let l:line .= '%#GitGutterAdd# +' . l:hunks[0] .
                        \ ' %#GitGutterChange#~' . l:hunks[1] .
                        \ ' %#GitGutterDelete#-' . l:hunks[2] . ' '
  endif

  return line
endfunction

set statusline=%!BuildStatusline()


" Keymappings

" insert the current date (iso format)
inoremap <c-d> <C-R>=strftime('%F')<CR>

" readonly save trick
cmap w!! w !sudo tee % >/dev/null

" hide search highlighting
nnoremap <silent> <esc> :silent :nohlsearch<CR>

" toggle visible whitespace
nmap <silent> <leader>s :set nolist!<CR>

" toggle paste mode
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

nmap <silent> <leader>p :set spell!<CR>
nmap <leader>f 1z=| " for quick fix word spelling
nnoremap <F2> :Rename | " quick rename current file

" control + space in terminal hack
map <C-@> <C-Space>
imap <C-@> <C-Space>

" omnicomplete
imap <C-Space> <c-x><c-o>

" use magic by default
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
map <silent> <c-space> :CtrlP<CR>
map <silent> <leader><space>p :CtrlP<CR>
map <silent> <leader><space>t :CtrlPTag<CR>
map <silent> <leader><space>m :CtrlPMRU<CR>
map <silent> <leader><space>b :CtrlPBuffer<CR>


" Vimux
function! VimuxSlime()
 call VimuxSendText(@v)
 call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <C-c><C-c> "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <C-c><C-c> vip<C-c><C-c>

" Prompt for a command to run
map <leader>bp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <leader>bl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <leader>bo :call VimuxOpenRunner()<CR>

" Inspect runner pane
map <leader>bi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <leader>bq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <leader>bx :VimuxInterruptRunner<CR>
" send eof
map <leader>bd :call VimuxSendKeys("^D")<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <leader>bz :call VimuxZoomRunner()<CR>


" gitgutter motions
nmap <leader>hl <Plug>GitGutterNextHunk
nmap <leader>hh <Plug>GitGutterPrevHunk

" sideways
nnoremap <silent> <leader>ah :SidewaysLeft<cr>
nnoremap <silent> <leader>al :SidewaysRight<cr>

" shortcut to system clipboard
vnoremap + "+
noremap + "+

" NVIM specific stuff
if has('nvim')
  " double escape to get out of terminal mode
  " (double to allow single esc to go to terminal)
  tnoremap <esc><esc> <c-\><c-n>
endif

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" shortcuts to completions
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

" Neomake
let g:neomake_tex_enabled_makers = ['chktex'] " use chktex by default (lacheck is also available)

function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'

    " save last search
    let _s=@/

    " save position
    normal mz
    normal Hmy

    " strip spaces
    %s/\s\+$//e

    " restore position
    normal 'yz<CR>
    normal `z

    " restore last search
    let @/=_s
  endif
endfunction


augroup vimrc
  autocmd!
  autocmd BufEnter,BufWritePost * Neomake
  autocmd BufWritePre * :call StripTrailingWhitespace()
augroup END


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


" has to be defined later in file than was previously
" to keep transparent background
hi Normal ctermbg=NONE

" listchars highlighting
hi SpecialKey guibg=red ctermbg=red

" vimcompletesme config
let g:vcm_default_maps = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger=""

" tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0

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

