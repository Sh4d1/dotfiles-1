" Samuel Walladge's vimrc
" inspiration for some parts found at:
"  - http://items.sjbach.com/319/configuring-vim-right
"  - https://github.com/timdawborn/dotfiles/blob/master/.vimrc
"  - https://github.com/wincent/wincent/tree/master/roles/dotfiles/files/.vim
"  - https://www.vi-improved.org/{recommendations,plugins}
"  - /r/vim
"  - and others...


" Load plugins with vim-plug
call plug#begin('~/.vim/plugged')

" enhancements that don't need (much) configuring
"   and don't provide commands/mappings
Plug 'ap/vim-css-color'                                                 " highlight colors in css
Plug 'ludovicchabant/vim-gutentags'                                     " auto-generate tags file
Plug 'luochen1990/rainbow'                                              " easier to see nested parens
Plug 'machakann/vim-highlightedyank'                                    " highlights currently yanked region
Plug 'tpope/vim-characterize'                                           " overrides ga
Plug 'tpope/vim-repeat'                                                 " better repeating for supported plugins
Plug 'tpope/vim-sleuth'                                                 " auto-set indent options
Plug 'tpope/vim-speeddating'                                            " make inc/dec numbers work with dates
Plug 'Yggdroot/indentLine'                                              " help for showing indent levels
Plug 'kshenoy/vim-signature'                                            " show marks in gutter
Plug 'Valloric/MatchTagAlways'                                          " highlight enclosing xml tags
Plug 'mhinz/vim-startify'
Plug 'editorconfig/editorconfig-vim'                                    " editorconfig support
Plug 'google/vim-searchindex'                                           " display info about current search position
Plug 'roxma/vim-tmux-clipboard'                                         " clipboard integration with tmux
Plug 'vim-utils/vim-husk'                                               " readline bindings for command mode (alternative to vim-rsi)
Plug 'cspeterson/vim-convert'                                           " use `units` to convert unit values
Plug 'https://github.com/mattn/webapi-vim.git'                          " library for interfacing with web apis
Plug 'https://github.com/AndrewRadev/undoquit.vim.git'  " undo close buffer/split/tab

" colorschemes
Plug 'romainl/flattened'                                                " (solarized)
Plug 'romainl/Apprentice'
" Plug 'lifepillar/vim-solarized8'
Plug 'chriskempson/base16-vim'
Plug 'cormacrelf/vim-colors-github'

" Plug 'https://github.com/blueyed/vim-diminactive'

" general enhancements providing various functions
Plug 'tpope/vim-obsession'                                              " saves sessions
Plug 'tpope/vim-commentary'                                             " commenting
Plug 'machakann/vim-sandwich'                                           " like tpope's surround, but more configurable
Plug 'tommcdo/vim-lion'                                                 " align things
Plug 'AndrewRadev/sideways.vim'                                         " move function args sideways
Plug 'mattn/emmet-vim'                                                  " emmet for html (like sparkup)
Plug 'justinmk/vim-sneak'                                               " alternative to f/t
Plug 'wellle/targets.vim'                                               " extra text objects
Plug 'tpope/vim-unimpaired'                                             " pair mappings
" Plug 'terryma/vim-expand-region'                                        " expand selected region of text
Plug 'wellle/visual-split.vim'                                          " easier splits
Plug 'romainl/vim-qf'                                                   " quickfix window improvements
Plug 'tpope/vim-eunuch'                                                 " shortcuts to shell commands (esp rename files)
Plug 'tpope/vim-abolish'                                                " random useful text things
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'       " spellcheck/proofreading enhancements
Plug 'tommcdo/vim-exchange'                                             " swap two things
Plug 'AndrewRadev/linediff.vim'
Plug 'AndrewRadev/splitjoin.vim'                                        " switch between single and multi lines quickly
Plug 'AndrewRadev/switch.vim'                                           " toggle things
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                        " show the undotree
Plug 'benmills/vimux'                                                   " run things in tmux
Plug 'justinmk/vim-dirvish'                                             " another alternative to netwr
Plug 'wincent/ferret'                                                   " search in files (plus qf enhancements)
Plug 'tpope/vim-db'                                                     " database interface
Plug 'zirrostig/vim-schlepp'                                            " move blockwise text
" Plug 'pelodelfuego/vim-swoop'                                           " thing
Plug 'dyng/ctrlsf.vim' "searching

" Language syntax/help
Plug 'jamessan/vim-gnupg'                                               " seamless editing pgp encrypted files
Plug 'cespare/vim-toml'                                                 " toml syntax
Plug 'lervag/vimtex'                                                    " latex
Plug 'wannesm/wmgraphviz.vim'                                           " graphviz dot
Plug 'saltstack/salt-vim'                                               " saltstack syntax
" Plug 'chrisbra/csv.vim'                                                 " csv sheets
Plug 'leafgarland/typescript-vim'                                       " typescript syntax + settings
" Plug 'Quramy/vim-js-pretty-template'                                    " javascript template string syntax
Plug 'godlygeek/tabular'                                                " tabular
Plug 'tmux-plugins/vim-tmux'                                            " tmux syntax
Plug 'fatih/vim-go'                                                     " golang
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'                                                      " jsx syntax/indenting support
" Plug 'ternjs/tern_for_vim', {'do': 'npm install', 'for': 'javascript'}  " javascript completions
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}                   " java completion
Plug 'davidhalter/jedi-vim', {'for': 'python'}                          " python completions + refactoring
Plug 'rust-lang/rust.vim'                                               " rust
Plug 'racer-rust/vim-racer'                                             " rust completion
Plug 'ElmCast/elm-vim'                                                  " elm
Plug 'chr4/nginx.vim'                                                   " nginx config help
Plug 'udalov/kotlin-vim'                                                " kotlin
Plug 'ledger/vim-ledger'                                                " ledger/hledger plaint text accounting language support

Plug 'janko-m/vim-test'


Plug 'https://gitlab.com/Lenovsky/nuake.git'  " quake style terminal


" Git integrations
Plug 'tpope/vim-fugitive'                                               " git commands from in vim
Plug 'airblade/vim-gitgutter'                                         " view hunks/changes in the gutter
Plug 'jreybert/vimagit'                                                 " interactive git stage/view/commit window
Plug 'junegunn/gv.vim'                                                  " git log viewer
Plug 'https://github.com/iberianpig/tig-explorer.vim'  " tig integration
Plug 'tpope/vim-rhubarb'
Plug 'sodapopcan/vim-twiggy'
Plug 'idanarye/vim-merginal'


" fuzzy finder
" for now, I think I'll keep ctrlp for situations where can't install other
" deps, and fzf for main use
Plug 'ctrlpvim/ctrlp.vim'                                               " fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }       " another fuzzy finder
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'                                                 " snippets machine
Plug 'honza/vim-snippets'                                               " extra snippets

" linter/fixer
Plug 'w0rp/ale'                                                         " another linter (better?)

" wiki/notes
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" NOTE: requires tasklib installed: `pip install --user tasklib`
Plug 'tbabej/taskwiki'

" load neovim specific plugins
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  Plug 'wokalski/autocomplete-flow' " requires `flow-bin` to be installed somewhere
  Plug 'zchee/deoplete-jedi'
  Plug 'zchee/deoplete-go', { 'do': 'make' }
  Plug 'fszymanski/deoplete-emoji'
  Plug 'nicoe/deoplete-khard'
  Plug 'eagletmt/neco-ghc' " haskell
endif

call plug#end()

filetype plugin indent on
syntax on

" options

set encoding=utf-8

" for local .vimrc support
set exrc
set secure
set title

" so don't lose undo history when switching buffers
set hidden

" see more lines on scrolling
set scrolloff=3
set sidescrolloff=3

" indenting
set autoindent
set smarttab
set expandtab
set softtabstop=2
set shiftwidth=2

" more accurate sentence text objects
" set cpoptions+=J

" better search behaviour
set tabstop=2
set ignorecase
set smartcase
set incsearch
set hlsearch

set backspace=indent,eol,start " allow backspace over indents, etc.
set number " turn on line numbering
set relativenumber " turn on relative line numbering as well
set ruler " cursor position info
set history=2000    " more history
set undolevels=5000 " and undolevels
set undofile

set updatetime=500

" set listchars=tab:»·,trail:·,eol:$,nbsp:• " for graphically displaying whitespace
set listchars=tab:»·,trail:•,nbsp:•,extends:»,precedes:« " for graphically displaying whitespace
set list

set wildmenu
set shortmess+=filnxtToOc " less 'press ... to continue' maybe
set showmode
set breakindent
set showbreak=…
set nospell " spellchecking off by default
set spelllang=en_au " correct language
set spellcapcheck=

set lazyredraw " don't redraw while replaying macros

set virtualedit=block

set formatoptions+=ncrqjl
set formatoptions-=t " don't auto wrap text - use gq manually
set formatoptions-=a " don't format the entire paragraph automatically

set nostartofline

" single global backup/swp/undo dirs
set backupdir=~/.vim/backup/
set directory=~/.vim/swp//
set undodir=~/.vim/undo/

set backup
set writebackup

" http://albertomiorin.com/blog/2012/12/10/autoread-and-autowrite-in-vim/index.html
set autoread
set noswapfile
set autowriteall

set cursorline
set textwidth=79

" set foldlevel=100
set foldclose=all

" allow conceal, but not if the cursor is on the line
set conceallevel=2
set concealcursor=

set completeopt=menu

" set colorcolumn=+1,+2,+3

" always show to avoid visual interruptions
set signcolumn=yes

" who needs mouse support :P
set mouse=

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

set gdefault " global substitute by default

set noshowmode

set thesaurus+=~/.vim/mthesaur.txt

let g:netrw_browsex_viewer = 'rifle'

" faster diff?
let g:diff_translations = 0

" VCS conflict markers should be highlighted
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let mapleader = "\<space>"
let maplocalleader = "\<space>"

" better % navigation
runtime macros/matchit.vim

try
  colorscheme flattened_dark
catch
  " the colorscheme fallback if none installed
  colorscheme torte
endtry

" 24 bit color support
set termguicolors

" Status Line
set laststatus=2

set statusline=%!functions#buildstatusline()

" neovim python provider
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Keymappings

" nnoremap <cr> @:

" readonly save trick
cmap w!! w !sudo tee % >/dev/null

cnoremap <c-p> <up>
cnoremap <c-n> <down>

nnoremap <silent> <esc> <esc>:nohlsearch \| redraw! \| silent! wa<cr>

" toggle paste mode
nnoremap <F3> :set invpaste paste?<cr>
set pastetoggle=<F3>

" quick fix spelling
nmap <leader>1 1z=
nmap <leader>2 2z=

" more consistent mapping
noremap Y y$

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

" moving between buffers
nnoremap <A-h> :bp<cr>
nnoremap <A-l> :bn<cr>

" run a macro on selected lines - press @, then the register name, then <enter>
" xnoremap @ :normal @

" undotree
nmap <silent> <leader>u :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1

" NVIM specific stuff
if has('nvim')
  " double escape to get out of terminal mode
  " (double to allow single esc to go to terminal)
  tnoremap <esc><esc> <c-\><c-n>
endif

" shortcuts to completions
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
" oMnicompletion
inoremap <silent> ,m <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

" diff
" map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
" map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
" map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>
nnoremap <silent> du :diffupdate<CR>

" Sideways
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

nnoremap <silent> >, :silent :SidewaysRight<cr>
nnoremap <silent> <, :silent :SidewaysLeft<cr>


let g:ale_statusline_format = ['%dE', '%dW', '']
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⨯'

let g:ale_linters = {
      \ 'java': [],
      \ 'python': ['pylint'],
      \ 'javascript': ['flow'],
      \ 'typescript': ['tslint'],
      \ 'elm': [],
      \ 'text': ['vale', 'proselint'],
      \ 'tex': ['vale', 'proselint'],
      \ 'markdown': ['proselint', 'mdl', 'vale'],
      \ 'kotlin': ['kotlinc'],
      \ 'haskell': [],
      \ 'ledger': ['ledger']
      \ }

let g:ale_fixers = {
      \ 'javascript': [
      \    'eslint'
      \ ],
      \ 'typescript': [
      \    'tslint'
      \ ],
      \ 'python': [
      \    'black',
      \    'isort'
      \ ],
      \ 'css': [
      \    'prettier'
      \ ],
      \ 'rust': [
      \    'rustfmt'
      \ ],
      \ 'c': [
      \    'clang-format'
      \ ],
      \ }

let g:ale_c_clangeformat_options = '-style=Mozilla'

nnoremap <leader>f :ALEFix<cr>
nnoremap <silent> coa :ALEToggle<cr>


nnoremap <silent> <leader>zz :silent :call functions#striptrailingwhitespace()<cr>

nnoremap <silent> <leader>se :silent :Sedit<cr>
nnoremap <silent> <leader>st :silent :Stabedit<cr>
nnoremap <silent> <leader>sv :silent :Svsplit<cr>
nnoremap <silent> <leader>ss :silent :Ssplit<cr>

imap <C-h> <BS>
cmap <C-h> <BS>

nnoremap <silent> <leader>K :silent ! $BROWSER https://en.wiktionary.org/wiki/<cword><cr>


" what I want saved/restored with views - previously the curdir was saved, which
" resulted in unexpected cwd when editing files at times...
set viewoptions=folds,cursor

augroup vimrc_views
 autocmd!
 autocmd BufWinLeave ?* if expand('%') != '' && expand('%') !~ '^fugitive' && &ft != 'gitcommit' | silent! mkview | endif
 autocmd BufWinEnter ?* if expand('%') != '' && expand('%') !~ '^fugitive' && &ft != 'gitcommit' | silent! loadview | endif
augroup END

augroup vimrc
  autocmd!
  autocmd BufHidden,FocusLost,InsertLeave ?* nested silent! wa
  autocmd ColorScheme * call functions#sethighlight()
  autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif
augroup END

" vimtex
let g:vimtex_latexmk_options = '-pdflatex="xelatex --shell-escape" -pdf'
" let g:vimtex_view_general_viewer = 'rifle'
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'

let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_mode = 0
let g:vimtex_quickfix_open_on_warning = 0

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
let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
" rg is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" vimcompletesme config
let g:vcm_default_maps = 1
let g:vcm_direction = 'p'

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
" https://github.com/neomake/neomake/issues/1097#issuecomment-298780826
" Causes issues with resizing (https://github.com/vim/vim/issues/931).
let g:qf_loclist_window_bottom = 0
let g:qf_window_bottom = 0

" Annoying with Neomake, but only on Vim?!
" Even with let `g:neomake_open_list = 2` !
let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_max_line_indicator = "fill"

" rust racer
let g:racer_cmd = "/usr/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 0

" rust
" let g:rustfmt_autosave = 1
" let g:rustfmt_fail_silently = 1
let g:rust_fold = 1
" let g:rust_shortener_url = ''
let g:rust_clip_command = 'xsel -ib'


" gutentags
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ '.hg': 'hg files',
      \ },
      \ }


" vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports" "auto-populate imports


" vim sandwich
" vim-surround style keymappings
runtime macros/sandwich/keymap/surround.vim


" emmet - note, conflicts with sparkup using this binding
let g:user_emmet_leader_key = '<c-e>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \  'typescript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}


" jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_definitions_command = "gd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>jn"
let g:jedi#rename_command = "<leader>jr"


" ultisnips
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-space>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/plugged/vim-snippets/UltiSnips']
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/UltiSnips'
let g:UltiSnipsEnableSnipMate=1


let g:autocomplete_flow#insert_paren_after_function = 0

" indentLine
let g:indentLine_setConceal = 0
" let g:indentLine_setColors = 0
let g:indentLine_char = '▏'


" Switch
let g:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['left', 'right'])
  \ ]


" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1


" vim-jsx
let g:jsx_ext_required = 0

" so that enter key also inserts a newline even if popup visible
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

" neco-ghc
let g:necoghc_use_stack = 1
