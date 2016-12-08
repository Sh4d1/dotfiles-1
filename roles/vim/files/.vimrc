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
Plug 'rbgrouleff/bclose.vim'                                              " close buffer without closing vim (needed by ranger vim)
Plug 'tpope/vim-repeat'                                                   " better repeating for supported plugins
Plug 'tomtom/tcomment_vim'                                                " commenting
Plug 'tpope/vim-speeddating'                                              " make inc/dec numbers work with dates
Plug 'tpope/vim-surround'                                                 " edit surrounding things
Plug 'tommcdo/vim-lion'                                                   " align things
Plug 'AndrewRadev/sideways.vim'                                           " move function args sideways
Plug 'rstacruz/sparkup', {'rtp': 'vim'}                                   " quick insert html tags
Plug 'justinmk/vim-sneak'                                                 " alternative to f/t
Plug 'jamessan/vim-gnupg'                                                 " seamless editing pgp encrypted files
Plug 'tpope/vim-eunuch'                                                   " shortcuts to shell commands (esp rename files)
Plug 'justinmk/vim-dirvish'                                               " another alternative to netwr
Plug 'wellle/targets.vim'                                                 " extra text objects
Plug 'francoiscabrol/ranger.vim'                                          " ranger file-picker in vim
Plug 'romainl/vim-qf'                                                     " quickfix window improvements
Plug 'tpope/vim-characterize'                                             " overrides ga
Plug 'machakann/vim-highlightedyank'                                      " highlights currently yanked region

                                                                          " Language help
Plug 'lervag/vimtex'                                                      " latex
Plug 'wannesm/wmgraphviz.vim'                                             " graphviz dot

                                                                          " Tags
Plug 'ludovicchabant/vim-gutentags'                                       " auto-generate tags file
Plug 'majutsushi/tagbar'                                                  " view tags easily

                                                                          " Git integrations
Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'                        " git integration
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
Plug 'tomasr/molokai'                                                     " alternate 256 color colorscheme (for when can't use solarized terminal)
Plug 'romainl/Apprentice'                                                 " alternate 256 color colorscheme
Plug 'nanotech/jellybeans.vim'                                            " alternate 256 color colorscheme

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

" set listchars=tab:»·,trail:·,eol:$,nbsp:⦸ " for graphically displaying whitespace
set listchars=tab:»·,trail:•,nbsp:⦸,extends:»,precedes:« " for graphically displaying whitespace
set list

set wildmenu
set shortmess=filnxtToO " less 'press ... to continue' maybe
set showmode
set breakindent
set showbreak=⤷
set nospell " spellchecking off by default
set spelllang=en_au " correct language
set spellcapcheck=

" set lazyredraw " don't redraw while replaying macros

set virtualedit=block

set formatoptions+=n

" single global backup/swp/undo dirs
set backupdir=~/.vim/backup/
set directory=~/.vim/swp//
set undodir=~/.vim/undo/

set backup
set writebackup

" http://albertomiorin.com/blog/2012/12/10/autoread-and-autowrite-in-vim/index.html
set autoread
set nohidden
set noswapfile
set autowriteall

augroup save
  au!
  au FocusLost ?* wall
augroup END

set iskeyword+=- " better - and essential for css

set cursorline
set textwidth=80

set highlight+=N:DiffText
set colorcolumn=+1,+2,+3

" https://robots.thoughtbot.com/faster-grepping-in-vim
" better grep with the silver searcher
set grepprg=ag\ --vimgrep
set grepformat=%f:%l:%c%m

if has('nvim')
  set inccommand=split
endif

" VCS conflict markers should be highlighted
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let mapleader = "\<space>"
let maplocalleader = "\<space>"

" better % navigation
runtime macros/matchit.vim

" solarized colorscheme
try
  colorscheme flattened_dark
catch
  colorscheme torte
endtry

" Status Line
set laststatus=2

set statusline=%!functions#buildstatusline()

" Keymappings

" nnoremap <cr> @:

" insert the current date (iso format)
inoremap ,d <c-r>=strftime('%F')<cr>

" readonly save trick
cmap w!! w !sudo tee % >/dev/null

cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>
cnoremap <c-p> <up>
cnoremap <c-n> <down>

cnoremap <c-v> <c-r>"

" hide search highlighting
nnoremap <silent> <esc> <esc>:silent :nohlsearch<cr>

" toggle paste mode
nnoremap <F3> :set invpaste paste?<cr>
set pastetoggle=<F3>

nmap <silent> <leader>s :set spell!<cr>

" quick fix spelling
nnoremap <leader>1 1z=
nnoremap <leader>2 2z=

" might as well
noremap Y y$

" Repeat last macro if in a normal buffer.
nnoremap <expr> <tab> empty(&buftype) ? '@@' : '<cr>'

nnoremap <F2> :Rename |

" control + space in terminal hack
map <C-@> <C-Space>
imap <C-@> <C-Space>

" use magic by default
nnoremap / /\v
vnoremap / /\v

" easy moving between splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" tagbar
nmap <silent> <leader>t :TagbarToggle<cr>

" undotree
nmap <silent> <leader>u :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1

" ctrl-p
map <silent> <c-space> :CtrlP<cr>
map <silent> <leader>p :CtrlP<cr>
map <silent> <leader>pp :CtrlP<cr>
map <silent> <leader>pt :CtrlPTag<cr>
map <silent> <leader>pm :CtrlPMRU<cr>
map <silent> <leader>pb :CtrlPBuffer<cr>


" Vimux
" If text is selected, save it in the v register and send that register to tmux
vmap <C-c><C-c> "vy :call functions#vimuxslime()<cr>

" Select current paragraph and send it to tmux
nmap <C-c><C-c> vip<C-c><C-c>

" Prompt for a command to run
map <leader>bp :VimuxPromptCommand<cr>

" Run last command executed by VimuxRunCommand
map <leader>bl :VimuxRunLastCommand<cr>

" Inspect runner pane
map <leader>bo :call VimuxOpenRunner()<cr>

" Inspect runner pane
map <leader>bi :VimuxInspectRunner<cr>

" Close vim tmux runner opened by VimuxRunCommand
map <leader>bq :VimuxCloseRunner<cr>

" Interrupt any command running in the runner pane
map <leader>bx :VimuxInterruptRunner<cr>
" send eof
map <leader>bd :call VimuxSendKeys("^D")<cr>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <leader>bz :call VimuxZoomRunner()<cr>


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
" oMnicompletion
inoremap <silent> ,m <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

" Sideways
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

nnoremap <silent> <leader>fl :silent :SidewaysRight<cr>
nnoremap <silent> <leader>fh :silent :SidewaysLeft<cr>

" Neomake
let g:neomake_tex_enabled_makers = ['chktex'] " use chktex by default (lacheck is also available)

" allow using jshint for json
let g:neomake_json_jshint_maker = {
        \ 'args': ['--verbose'],
        \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
        \ }
let g:neomake_json_enabled_makers = ['jshint']

nnoremap <silent> <leader>zz :silent :call functions#striptrailingwhitespace()<cr>

augroup vimrc
  autocmd!
  autocmd BufWritePost ?* Neomake
  autocmd ColorScheme * call functions#sethighlight()
  " autocmd BufEnter,FocusGained,VimEnter,WinEnter ?* let &l:colorcolumn='+' . join(range(1, 3), ',+')
  " autocmd FocusLost,WinLeave ?* let &l:colorcolumn=join(range(1,255), ',')
augroup END


" vimtex
let g:vimtex_latexmk_options = '-pdflatex="xelatex --shell-escape" -pdf'
let g:vimtex_view_general_viewer = 'rifle'
let g:tex_flavor = "latex"

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

" vimcompletesme config
let g:vcm_default_maps = 1
let g:vcm_direction = 'p'

" ultisnips
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-space>"
let g:UltiSnipsJumpBackwardTrigger=""

" tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0

" gitgutter
let g:gitgutter_diff_base = 'HEAD'

" jedi-vim
" let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>jn"
" already have other keybindings for omnicompletion
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>jr"

" graphviz
let g:WMGraphviz_viewer = 'rifle'

" gnupg
let g:GPGPossibleRecipients=[
        \"Samuel Walladge <samuel@swalladge.id.au>",
      \]

" set up the custom highlights now, or else would have been overridden
call functions#sethighlight()

" vim-qf
let g:qf_mapping_ack_style = 1

if !has('nvim')
  map y <Plug>(highlightedyank)
endif
