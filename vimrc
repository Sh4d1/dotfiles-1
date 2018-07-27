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
Plug 'vim-utils/vim-husk'                                               " readline bindings for command mode
Plug 'cspeterson/vim-convert'                                           " use `units` to convert unit values
Plug 'https://github.com/mattn/webapi-vim.git'                          " library for interfacing with web apis
Plug 'https://github.com/AndrewRadev/undoquit.vim.git'  " undo close buffer/split/tab

" colorschemes
Plug 'romainl/flattened'                                                " (solarized)
Plug 'romainl/Apprentice'                                               " alternate 256 color colorscheme


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
Plug 'pelodelfuego/vim-swoop'                                           " thing
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


" Git integrations
Plug 'tpope/vim-fugitive'                                               " git commands from in vim
" Plug 'airblade/vim-gitgutter'                                         " view hunks/changes in the gutter
Plug 'mhinz/vim-signify'                                                " view hunks/changes in the gutter
Plug 'jreybert/vimagit'                                                 " interactive git stage/view/commit window
Plug 'junegunn/gv.vim'                                                  " git log viewer
Plug 'rhysd/committia.vim'                                              " nicer editing git commit messages

" Completion
" Plug 'ajh17/VimCompletesMe'                                             " tab completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Plug 'carlitux/deoplete-ternjs'  " requires `tern` to be installed - `npm install -g tern` (or supply full path to bin)
  Plug 'wokalski/autocomplete-flow' " requires `flow-bin` to be installed somewhere
  Plug 'zchee/deoplete-jedi'
  Plug 'zchee/deoplete-go', { 'do': 'make' }
  Plug 'fszymanski/deoplete-emoji'
  " Plug 'sebastianmarkow/deoplete-rust'
  Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
endif


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
Plug 'tbabej/taskwiki'

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

" set listchars=tab:»·,trail:·,eol:$,nbsp:⦸ " for graphically displaying whitespace
set listchars=tab:»·,trail:•,nbsp:⦸,extends:»,precedes:« " for graphically displaying whitespace
set list

set wildmenu
set shortmess+=filnxtToOc " less 'press ... to continue' maybe
set showmode
set breakindent
set showbreak=⤷
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

" set colorcolumn=+1,+2,+3

set signcolumn=yes " always show

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

" seems to crash neovim with the other settings i have
" if has('nvim')
"   set inccommand=split
" endif

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

" moving between buffers
nnoremap <A-h> :bp<cr>
nnoremap <A-l> :bn<cr>

" run a macro on selected lines - press @, then the register name, then <enter>
" xnoremap @ :normal @

" undotree
nmap <silent> <leader>u :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1

" ctrl-p
map <silent> <c-p> :CtrlP<cr>
map <silent> <leader>pp :CtrlP<cr>
map <silent> <leader>pt :CtrlPTag<cr>
map <silent> <leader>pm :CtrlPMRU<cr>
map <silent> <leader>pb :CtrlPBuffer<cr>

" fzf
map <silent> <c-space> :Files<cr>
map <silent> <leader>t :Tags<cr>
map <silent> <leader>m :Marks<cr>
let g:fzf_layout = { 'down': '~20%' }


" Vimux
" If text is selected, save it in the v register and send that register to tmux
vmap <C-c><C-c> "vy :call functions#vimuxslime()<cr>

" Select current paragraph and send it to tmux
nmap <C-c><C-c> vip<C-c><C-c>

" Prompt for a command to run
map <leader>bp :VimuxPromptCommand<cr>

" Run last command executed by VimuxRunCommand
map <leader>bl :silent! wa <bar> :VimuxRunLastCommand<cr>

" Inspect runner pane
map <leader>bo :call VimuxOpenRunner()<cr>

" Inspect runner pane
map <leader>bi :VimuxInspectRunner<cr>

" Close vim tmux runner opened by VimuxRunCommand
map <leader>bq :VimuxCloseRunner<cr>

" Interrupt any command running in the runner pane
map <leader>bc :VimuxInterruptRunner<cr>

" send eof
map <leader>bd :call VimuxSendKeys("^D")<cr>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <leader>bz :call VimuxZoomRunner()<cr>


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
      \ 'python': ['pylint'],
      \ 'javascript': ['flow'],
      \ 'typescript': ['tslint'],
      \ 'elm': [],
      \ 'text': ['vale', 'proselint'],
      \ 'tex': ['vale', 'proselint'],
      \ 'markdown': ['proselint', 'mdl', 'vale'],
      \ 'kotlin': ['kotlinc'],
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
      \ }

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

" gitgutter
let g:gitgutter_diff_base = 'HEAD'
" nnoremap <silent> cog :GitGutterSignsToggle<cr>

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

if !has('nvim')
  map y <Plug>(highlightedyank)
endif

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_max_line_indicator = "fill"

" rust
let g:racer_cmd = "/usr/bin/racer"
let g:racer_experimental_completer = 1
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

" vim-startify

autocmd User Startified setlocal cursorline

let g:startify_enable_special         = 1
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 0
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ $HOME . '/.vim/plugged/.*',
      \ ]

let g:startify_bookmarks = [
      \ { 'v': '~/.vimrc' },
      \ { 'z': '~/.zshrc' },
      \ ]

let g:startify_custom_header = [ '   VIM' ]
" " ascii art from http://www.vim.org/images/vim.txt
" let g:startify_custom_header = [
"     \ "        ________ ++     ________",
"     \ "       /VVVVVVVV\\++++  /VVVVVVVV\\",
"     \ "       \\VVVVVVVV/++++++\\VVVVVVVV/",
"     \ "        |VVVVVV|++++++++/VVVVV/'",
"     \ "        |VVVVVV|++++++/VVVVV/'",
"     \ "       +|VVVVVV|++++/VVVVV/'+",
"     \ "     +++|VVVVVV|++/VVVVV/'+++++",
"     \ "   +++++|VVVVVV|/VVVVV/'+++++++++",
"     \ "     +++|VVVVVVVVVVV/'+++++++++",
"     \ "       +|VVVVVVVVV/'+++++++++",
"     \ "        |VVVVVVV/'+++++++++",
"     \ "        |VVVVV/'+++++++++",
"     \ "        |VVV/'+++++++++",
"     \ "        'V/'   ++++++",
"     \ "                 ++",
"     \ ]
"
let g:startify_custom_footer =
      \ ['', "   Vim is charityware. Run ':h iccf' for more information.", '']

let g:startify_commands = [
      \ {'U': 'PlugUpdate'},
      \ {'I': 'PlugInstall'},
      \ {'V': 'GV'},
      \ ]

autocmd User Startified setlocal buftype=nofile


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



" Ferret
let g:FerretMap = 0
let g:FerrerLazyInit=0
nmap <leader>aa <Plug>(FerretAck)
nmap <leader>ar <Plug>(FerretAcks)
nmap <leader>aw <Plug>(FerretAckWord)
nmap <leader>al <Plug>(FerretLack)

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

" vim-go
" map

" deoplete

set completeopt=menu

function! s:check_back_space() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~ '\s'
endfunction

if has('nvim')
  let g:deoplete#enable_at_startup = 1

  " let g:deoplete#disable_auto_complete = 1

  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()

  inoremap <silent><expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()

  if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

  call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

  " let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'

  let g:nvim_typescript#default_mappings = 1


  call deoplete#custom#option('omni_patterns', {
  \ 'ledger': '^    \(\w \w\|\w\|:\)\+',
  \})
endif

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


" vim-numbertoggle - Automatic toggling between 'hybrid' and absolute line numbers
" Maintainer:        <https://jeffkreeftmeijer.com>
" Version:           2.1.1
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END


" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1


" vim-jsx
let g:jsx_ext_required = 0

" vim-signature
nnoremap <silent> com :SignatureToggleSigns<cr>


" so that enter key also inserts a newline even if popup visible
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"


" vimwiki config
let g:vimwiki_list = [
    \ {
      \ 'path': '~/wiki/',
      \ 'path_html': '~/wiki_html/',
      \ 'auto_toc': 1,
      \ 'index': 'index',
      \ 'automatic_nested_syntaxes': 1,
      \ 'template_path': '~/wiki/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'css_name': 'style.css',
      \ 'auto_tags': 1,
    \ },
    \ {
      \ 'path': '~/.nextcloud-notes/',
      \ 'auto_toc': 1,
      \ 'index': 'index',
      \ 'automatic_nested_syntaxes': 1,
      \ 'ext': '.txt',
      \ 'syntax': 'markdown',
      \ 'auto_tags': 1,
    \ }
  \ ]
let g:vimwiki_folder = 'expr'
let g:vimwiki_auto_chdir = 1
let g:vimwiki_hl_headers = 1
let g:vimwiki_dir_link = 'index'

let g:taskwiki_disable_concealcursor = 'yes'
" i want to manage mk/load views myself
let g:taskwiki_dont_preserve_folds = 'yes'
let g:vimwiki_global_ext = 0


" schlepp
vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <left>  <Plug>SchleppLeft
vmap <right> <Plug>SchleppRight
vmap <leader>d       <Plug>SchleppDup
let g:Schlepp#allowSquishingLines = 1
let g:Schlepp#allowSquishingBlock = 1
let g:Schlepp#reindent = 1

" vim-signify
let g:signify_vcs_list = ['git']
let g:signify_realtime = 0

" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)
