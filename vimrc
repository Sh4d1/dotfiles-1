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
" Plug 'tomtom/tcomment_vim'                                                " commenting
Plug 'tpope/vim-commentary'                                                " commenting
Plug 'tpope/vim-speeddating'                                              " make inc/dec numbers work with dates
" Plug 'tpope/vim-surround'                                                 " edit surrounding things
Plug 'machakann/vim-sandwich'                                             " different surround - more features
Plug 'tommcdo/vim-lion'                                                   " align things
Plug 'AndrewRadev/sideways.vim'                                           " move function args sideways
" Plug 'rstacruz/sparkup', {'rtp': 'vim'}                                   " quick insert html tags
Plug 'mattn/emmet-vim'                                                    " emmet for html (like sparkup)
Plug 'justinmk/vim-sneak'                                                 " alternative to f/t
Plug 'jamessan/vim-gnupg'                                                 " seamless editing pgp encrypted files
Plug 'tpope/vim-eunuch'                                                   " shortcuts to shell commands (esp rename files)
Plug 'justinmk/vim-dirvish'                                               " another alternative to netwr
Plug 'wellle/targets.vim'                                                 " extra text objects
" Plug 'francoiscabrol/ranger.vim'                                          " ranger file-picker in vim
Plug 'romainl/vim-qf'                                                     " quickfix window improvements
Plug 'tpope/vim-characterize'                                             " overrides ga
Plug 'machakann/vim-highlightedyank'                                      " highlights currently yanked region
Plug 'editorconfig/editorconfig-vim'                                      " editorconfig support
Plug 'terryma/vim-expand-region'                                          " expand selected region of text
Plug 'wellle/visual-split.vim'                                            " easier splits
Plug 'wellle/tmux-complete.vim'
Plug 'sbdchd/neoformat'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mhinz/vim-startify'
Plug 'tommcdo/vim-exchange'                                               " swap two things
Plug 'tpope/vim-abolish'                                                  " random useful text things
Plug 'tpope/vim-sleuth'                                                   " auto-set indent options
Plug 'google/vim-searchindex'                                             " display info about current search position
Plug 'AndrewRadev/splitjoin.vim'                                          " switch between single and multi lines quickly
Plug 'AndrewRadev/switch.vim'                                             " toggle things
" Plug 'rhysd/committia.vim'                                                " nicer editing git commit messages
Plug 'airblade/vim-rooter'                                                " auto change to project root
Plug 'johngrib/vim-game-code-break'                                       " random
Plug 'wincent/loupe'                                                     " highlighted search
Plug 'tpope/vim-unimpaired'                                                     " pair mappings
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'kshenoy/vim-signature'                 " show marks in gutter
Plug 'tpope/vim-rsi'                 " readlink bindings in insert mode
Plug 'Yggdroot/indentLine' " help for showing indent levels
Plug 'AndrewRadev/linediff.vim'
Plug 'tpope/vim-obsession'
Plug 'Valloric/MatchTagAlways'


" Language help
Plug 'lervag/vimtex'                                                      " latex
Plug 'wannesm/wmgraphviz.vim'                                             " graphviz dot
Plug 'saltstack/salt-vim'                                                 " saltstack syntax
Plug 'chrisbra/csv.vim'                                                   " csv sheets
Plug 'rust-lang/rust.vim'                                                 " rust
Plug 'fatih/vim-go'                                                       " golang
Plug 'leafgarland/typescript-vim' " typescript syntax + settings
" Plug 'Quramy/tsuquyomi' " typescript omnicompletion and other good stuff
Plug 'godlygeek/tabular'                                                  " tabular
" Plug 'plasticboy/vim-markdown'                                            " markdown - don't really need it
Plug 'metakirby5/codi.vim'
" Tags
Plug 'ludovicchabant/vim-gutentags'                                       " auto-generate tags file
Plug 'ElmCast/elm-vim'                                       " elm
" Plug 'majutsushi/tagbar'                                                  " view tags easily
Plug 'tmux-plugins/vim-tmux'

" this auto pairs things are kind of annoying mostly...
" Plug 'jiangmiao/auto-pairs'                                                  " auto insert pairs of things
" Plug 'cohama/lexima.vim'                                        " endwise + auto-pairs


" Git integrations
Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'                        " git integration
Plug 'airblade/vim-gitgutter'                                             " view hunks/changes in the gutter
Plug 'jreybert/vimagit'                                                   " interactive git stage/view/commit window
Plug 'cohama/agit.vim'  " git log viewer
Plug 'gregsexton/gitv', {'on': ['Gitv']}

" Completions
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}                     " java completion
Plug 'davidhalter/jedi-vim', {'for': 'python'}                            " python completions + refactoring
Plug 'ternjs/tern_for_vim', {'do': 'npm install', 'for': 'javascript'}    " javascript completions
Plug 'racer-rust/vim-racer'                                               " rust completion
Plug 'ajh17/VimCompletesMe'                                               " tab completion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Utilities
" for now, I think I'll keep ctrlp for situations where can't install other
" deps, and fzf for main use
Plug 'ctrlpvim/ctrlp.vim'                                                 " fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }         " another fuzzy finder
Plug 'junegunn/fzf.vim'
" Plug 'wincent/command-t', {
"       \   'do': 'cd ruby/command-t && make clean && ruby extconf.rb && make'
"       \ }
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }                         " another fuzzy finder

Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                          " show the undotree
Plug 'benmills/vimux'                                                     " run things in tmux
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'                       " snippets
Plug 'neomake/neomake'                                                    " async make + gutter signs
" Plug 'w0rp/ale'                                                           " another linter
Plug 'wincent/ferret'                                                     " search in files

" Pretty
Plug 'luochen1990/rainbow'                                                " easier to see nested parens
Plug 'ap/vim-css-color'                                                   " highlight colors in css
Plug 'romainl/flattened'                                                  " (solarized)
Plug 'tomasr/molokai'                                                     " alternate 256 color colorscheme (for when can't use solarized terminal)
Plug 'romainl/Apprentice'                                                 " alternate 256 color colorscheme
Plug 'nanotech/jellybeans.vim'                                            " alternate 256 color colorscheme
Plug 'chriskempson/base16-vim'

" add plugins to &runtimepath
call plug#end()

let g:yankstack_yank_keys = ['y', 'd', 'D', 'C', 'c']
call yankstack#setup()
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste

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

set conceallevel=2

" no longer supported in neovim
" set highlight+=N:DiffText

set colorcolumn=+1,+2,+3

set mouse=

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

set gdefault " global substitute by default

" set autochdir

" https://robots.thoughtbot.com/faster-grepping-in-vim
" better grep with the silver searcher
" set grepprg=ag\ --vimgrep
" set grepformat=%f:%l:%c%m

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
" Ultisnips makes this redundant: type `date<trigger>`
" inoremap ,d <c-r>=strftime('%F')<cr>

" readonly save trick
cmap w!! w !sudo tee % >/dev/null

cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>
cnoremap <c-p> <up>
cnoremap <c-n> <down>

cnoremap <c-v> <c-r>"

" hide search highlighting
" nnoremap <esc> <esc>:nohlsearch \| wa<cr>
nnoremap <silent> <esc> <esc>:execute "normal \<Plug>(LoupeClearHighlight)" \|:wa<cr>

" toggle paste mode
nnoremap <F3> :set invpaste paste?<cr>
set pastetoggle=<F3>

" quick fix spelling
nnoremap <leader>1 1z=
nnoremap <leader>2 2z=

" more consistent mapping
noremap Y y$

" Repeat last macro if in a normal buffer.
" NO! I want to use it for the default - <c-i> or tab is opposite of <c-o>
" nnoremap <expr> <tab> empty(&buftype) ? '@@' : '<cr>'

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

" https://www.reddit.com/r/vim/comments/6h0dy7/which_autoclosing_plugin_do_you_use/diujtbd/
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

" run a macro on selected lines - press @, then the register name, then <enter>
xnoremap @ :normal @

" tagbar
" nmap <silent> <leader>t :TagbarToggle<cr>

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
map <leader>bl :w <bar> :VimuxRunLastCommand<cr>

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

nnoremap <silent> >, :silent :SidewaysRight<cr>
nnoremap <silent> <, :silent :SidewaysLeft<cr>


" Neomake (unused - see ALE below)
let g:neomake_open_list = 0
let g:airline#extensions#neomake#enabled = 0
let g:neomake_tex_enabled_makers = ['chktex'] " use chktex by default (lacheck is also available)
let g:neomake_haskell_enabled_makers = [] " disable haskell
let g:neomake_elm_enabled_makers = [] " also disable elm

" allow using jshint for json
let g:neomake_json_jshint_maker = {
      \ 'args': ['--verbose'],
      \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
      \ }
let g:neomake_json_enabled_makers = ['jshint']
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_vim_enabled_makers = ['vint']

" ALE (crashing currently, so neomake is actually in use)
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'

let g:ale_linters = {
      \ 'python': ['pylint'],
      \ 'javascript': ['jshint'],
      \ 'elm': [],
      \ 'text': ['vale', 'proselint'],
      \ 'markdown': ['proselint', 'mdl', 'vale']
      \ }


nnoremap <silent> <leader>zz :silent :call functions#striptrailingwhitespace()<cr>

nnoremap <silent> <leader>se :silent :Sedit<cr>
nnoremap <silent> <leader>st :silent :Stabedit<cr>
nnoremap <silent> <leader>sv :silent :Svsplit<cr>
nnoremap <silent> <leader>ss :silent :Ssplit<cr>

imap <C-h> <BS>
cmap <C-h> <BS>

set viewoptions-=options

augroup vimrc_views
 autocmd!
 autocmd BufWinLeave ?* if expand('%') != '' && expand('%') !~ '^fugitive' && &ft != 'gitcommit' | silent! mkview | endif
 autocmd BufWinEnter ?* if expand('%') != '' && expand('%') !~ '^fugitive' && &ft != 'gitcommit' | silent! loadview | endif
augroup END

augroup vimrc
  autocmd!
  autocmd BufHidden ?* silent! wa
  autocmd FocusLost,InsertLeave ?* silent! wa | Neomake
  " NOTE: can't use TextChanged event as below when using vim-surround - breaks repeating its actions with repeat.vim
  " https://github.com/tpope/vim-repeat/issues/59
  " also breaks repeat with sneak
  " autocmd TextChanged ?* silent! wa | Neomake
  autocmd BufWritePost ?* Neomake
  autocmd ColorScheme * call functions#sethighlight()
  " autocmd BufEnter,FocusGained,VimEnter,WinEnter ?* let &l:colorcolumn='+' . join(range(1, 3), ',+')
  " autocmd FocusLost,WinLeave ?* let &l:colorcolumn=join(range(1,255), ',')
  autocmd FocusGained,CursorHold ?* checktime

  " http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file - use autochdir instead
  " autocmd BufEnter * call functions#autochdir_hacked()
augroup END


" vimtex
let g:vimtex_latexmk_options = '-pdflatex="xelatex --shell-escape" -pdf'
" let g:vimtex_view_general_viewer = 'rifle'
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'

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
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" vimcompletesme config
let g:vcm_default_maps = 1
let g:vcm_direction = 'p'

" ultisnips
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-space>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/plugged/vim-snippets/UltiSnips']
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/UltiSnips'
let g:UltiSnipsEnableSnipMate=1


" tagbar
" let g:tagbar_autofocus = 1
" let g:tagbar_autoclose = 1
" let g:tagbar_sort = 0

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

let g:CommandTFileScanner = "git"

let g:racer_cmd = "/usr/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1

let g:rust_fold = 1



" let g:gutentags_ctags_exclude = [
"   \ "env/*",
"   \ "venv/*",
"   \ ]

let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ '.hg': 'hg files',
      \ },
      \ }

" gollum wikis
nnoremap <leader>ww :e ~/projects/private-wiki/Home.md<cr>
nnoremap <leader>wp :e ~/projects/public-wiki/Home.md<cr>

" markdown
" let g:vim_markdown_no_extensions_in_markdown = 1
" let g:vim_markdown_autowrite = 1
" let g:vim_markdown_new_list_item_indent = 0
" let g:vim_markdown_frontmatter = 1
" let g:vim_markdown_math = 1

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
" let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ $HOME . '/.vim/plugged/.*',
      \ ]

let g:startify_bookmarks = [
      \ { 'v': '~/.vimrc' },
      \ { 'z': '~/.zshrc' },
      \ { 'w': '~/projects/private-wiki/Home.md' },
      \ { 'p': '~/projects/public-wiki/Home.md' },
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
      \ {'P': 'Sedit | Codi python'},
      \ ]

autocmd User Startified setlocal buftype=nofile


" vim sandwich
" vim-surround style keymappings
runtime macros/sandwich/keymap/surround.vim


" sparkup
" let g:sparkupNextMapping = ',<c-e>'

" emmet - note, conflicts with sparkup using this binding
let g:user_emmet_leader_key = '<c-e>'

" committia
" let g:committia_hooks = {}
" function! g:committia_hooks.edit_open(info)
"   " If no commit message, start with insert mode
"   " if a:info.vcs ==# 'git' && getline(1) ==# ''
"   "     startinsert
"   " end
"
"   " Scroll the diff window from edit window
"   nmap <buffer><c-f> <Plug>(committia-scroll-diff-down-half)
"   nmap <buffer><c-b> <Plug>(committia-scroll-diff-up-half)
"   imap <buffer><c-f> <Plug>(committia-scroll-diff-down-half)
"   imap <buffer><c-b> <Plug>(committia-scroll-diff-up-half)
"
" endfunction
"
" function! g:committia_hooks.diff_open(info)
"   setlocal norelativenumber
"   setlocal number
"
" endfunction


" neoformat
let g:neoformat_run_all_formatters = 1
let g:neoformat_only_msg_on_error = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_try_formatprg = 1
let g:neoformat_enabled_python = ['yapf']
nnoremap <leader>f :Neoformat<cr>



let g:rooter_targets = '/,*'
let g:rooter_manual_only = 1
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 0
let g:rooter_use_lcd = 1
let g:rooter_patterns = ['.git/', '_darcs/', '.hg/', '.bzr/', '.svn/', 'README.md']

nnoremap <leader>cr :Rooter<cr>:pwd<cr>
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

" Ferret
let g:FerretMap = 0
" let g:FerretQFCommands = 0
nmap <leader>a <Plug>(FerretAck)
nmap <leader>r <Plug>(FerretAcks)

" loupe
let g:LoupeCenterResults=0

" deoplete
" let g:deoplete#enable_at_startup = 1

" let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
" let g:deoplete#sources#rust#rust_source_path='/home/samuel/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" AutoPairs
" let g:AutoPairsCenterLine = 0

" lexima
nnoremap <silent> cop :call functions#toggle_lexima()<cr>

" indentLine
let g:indentLine_setConceal = 0
" let g:indentLine_setColors = 0
let g:indentLine_char = '▏'


" so we don't leak
augroup vimrc_security
  autocmd!
  autocmd BufNewFile,BufRead /dev/shm/gopass* set noundofile nobackup nowritebackup noswapfile viminfo=""
  autocmd BufNewFile,BufRead /dev/shm/pass* set noundofile nobackup nowritebackup noswapfile viminfo=""
  autocmd BufNewFile,BufRead /tmp/* set noundofile nobackup nowritebackup noswapfile viminfo=""
augroup END
