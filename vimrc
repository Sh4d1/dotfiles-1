" Samuel Walladge's vimrc
" inspiration for some parts found at:
"  - http://items.sjbach.com/319/configuring-vim-right
"  - https://github.com/timdawborn/dotfiles/blob/master/.vimrc
"  - https://github.com/wincent/wincent/tree/master/roles/dotfiles/files/.vim
"  - https://www.vi-improved.org/{recommendations,plugins}
"  - /r/vim
"  - and others...

" TODO: move custom functions to autoload for speed

function! PackInit() abort
  if glob(expand('~/.vim/pack/bundle/opt/minpac')) == ''
    !git clone https://github.com/k-takata/minpac $HOME/.vim/pack/bundle/opt/minpac
  endif

  packadd minpac
  call minpac#init({'package_name': 'bundle'})

  " self manage
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " libraries that are dependencies for other plugins
  " webapi currently only used by rust.vim for :RustPlay
  call minpac#add('https://github.com/mattn/webapi-vim.git')

  " Autoloaded plugins.
  " These are plugins that don't require any config and just make Vim nicer in
  " general.
  "
  " flattened is a solarized colorscheme
  call minpac#add('https://github.com/romainl/flattened.git')
  call minpac#add('https://github.com/romainl/Apprentice.git')
  call minpac#add('https://github.com/ap/vim-css-color.git')
  call minpac#add('https://github.com/tpope/vim-characterize.git')
  call minpac#add('https://github.com/tpope/vim-repeat.git')
  call minpac#add('https://github.com/tpope/vim-sleuth.git')
  call minpac#add('https://github.com/tpope/vim-eunuch.git')
  call minpac#add('https://github.com/vim-utils/vim-husk.git')
  call minpac#add('https://github.com/tpope/vim-speeddating.git')


  " Autoloaded plugins that do have config
  call minpac#add('https://github.com/ludovicchabant/vim-gutentags.git')
  call minpac#add('https://github.com/luochen1990/rainbow.git')
  call minpac#add('https://github.com/w0rp/ale.git')
  call minpac#add('https://github.com/vimwiki/vimwiki.git', {'branch': 'dev'})
  call minpac#add('https://github.com/tbabej/taskwiki.git', {'do': '!pip install --user -U tasklib'})
  call minpac#add('https://github.com/mhinz/vim-startify.git')
  call minpac#add('https://github.com/machakann/vim-sandwich.git')
  call minpac#add('https://github.com/airblade/vim-gitgutter.git')
  call minpac#add('https://github.com/AndrewRadev/switch.vim.git')
  call minpac#add('https://github.com/tommcdo/vim-exchange.git')
  call minpac#add('https://github.com/wellle/targets.vim.git')
  call minpac#add('https://github.com/justinmk/vim-sneak.git')
  call minpac#add('https://github.com/AndrewRadev/splitjoin.vim.git')
  call minpac#add('https://github.com/AndrewRadev/sideways.vim.git')
  call minpac#add('https://github.com/mbbill/undotree.git')
  call minpac#add('https://github.com/justinmk/vim-dirvish.git')

  call minpac#add('https://github.com/tpope/vim-fugitive.git')
  call minpac#add('https://github.com/tpope/vim-rhubarb.git')
  call minpac#add('https://github.com/junegunn/gv.vim.git')

  call minpac#add('https://github.com/junegunn/fzf.git', {'do': '!./install --bin'})
  call minpac#add('https://github.com/junegunn/fzf.vim.git') " depends on fzf above

  call minpac#add('https://github.com/SirVer/ultisnips.git')
  call minpac#add('https://github.com/honza/vim-snippets.git')


  " TODO: go through these plugins
  call minpac#add('https://github.com/machakann/vim-highlightedyank.git')
  call minpac#add('https://github.com/Yggdroot/indentLine.git')
  call minpac#add('https://github.com/kshenoy/vim-signature.git')
  call minpac#add('https://github.com/Valloric/MatchTagAlways.git')
  call minpac#add('https://github.com/editorconfig/editorconfig-vim.git')
  call minpac#add('https://github.com/google/vim-searchindex.git')
  call minpac#add('https://github.com/roxma/vim-tmux-clipboard.git')
  call minpac#add('https://github.com/cspeterson/vim-convert.git')
  call minpac#add('https://github.com/AndrewRadev/undoquit.vim.git')
  call minpac#add('https://github.com/tpope/vim-obsession.git')
  call minpac#add('https://github.com/tpope/vim-commentary.git')
  call minpac#add('https://github.com/tommcdo/vim-lion.git')
  call minpac#add('https://github.com/mattn/emmet-vim.git')
  call minpac#add('https://github.com/tpope/vim-unimpaired.git')
  call minpac#add('https://github.com/wellle/visual-split.vim.git')
  call minpac#add('https://github.com/romainl/vim-qf.git')
  call minpac#add('https://github.com/tpope/vim-abolish.git')
  call minpac#add('https://github.com/AndrewRadev/linediff.vim.git')
  call minpac#add('https://github.com/benmills/vimux.git')
  call minpac#add('https://github.com/wincent/ferret.git')
  call minpac#add('https://github.com/zirrostig/vim-schlepp.git')
  call minpac#add('https://github.com/jamessan/vim-gnupg.git')
  call minpac#add('https://github.com/cespare/vim-toml.git')
  call minpac#add('https://github.com/lervag/vimtex.git')
  call minpac#add('https://github.com/wannesm/wmgraphviz.vim.git')
  call minpac#add('https://github.com/saltstack/salt-vim.git')
  call minpac#add('https://github.com/leafgarland/typescript-vim.git')
  call minpac#add('https://github.com/godlygeek/tabular.git')
  call minpac#add('https://github.com/tmux-plugins/vim-tmux.git')
  call minpac#add('https://github.com/fatih/vim-go.git')
  call minpac#add('https://github.com/pangloss/vim-javascript.git')
  call minpac#add('https://github.com/mxw/vim-jsx.git')
  call minpac#add('https://github.com/davidhalter/jedi-vim',)
  call minpac#add('https://github.com/rust-lang/rust.vim.git')
  call minpac#add('https://github.com/racer-rust/vim-racer.git')
  call minpac#add('https://github.com/ElmCast/elm-vim.git')
  call minpac#add('https://github.com/chr4/nginx.vim.git')
  call minpac#add('https://github.com/udalov/kotlin-vim.git')
  call minpac#add('https://github.com/ledger/vim-ledger.git')
  call minpac#add('https://github.com/janko-m/vim-test.git')
  call minpac#add('https://gitlab.com/Lenovsky/nuake.git')
  call minpac#add('https://github.com/jreybert/vimagit.git')
  call minpac#add('https://github.com/sodapopcan/vim-twiggy.git')
  call minpac#add('https://github.com/idanarye/vim-merginal.git')


  " plugins that are put in the opt directory (not auto loaded)
  " deoplete (autocompletion engine)
  call minpac#add('https://github.com/Shougo/deoplete.nvim.git', {'do': ':UpdateRemotePlugins', 'type': 'opt' })

  " deoplete plugins
  call minpac#add('https://github.com/wokalski/autocomplete-flow', {'type': 'opt'})
  call minpac#add('https://github.com/zchee/deoplete-jedi', {'type': 'opt'})
  call minpac#add('https://github.com/zchee/deoplete-go', {'do': '!make', 'type': 'opt'})
  call minpac#add('https://github.com/fszymanski/deoplete-emoji', {'type': 'opt'})
  call minpac#add('https://github.com/nicoe/deoplete-khard', {'type': 'opt'})
  call minpac#add('https://github.com/eagletmt/neco-ghc', {'type': 'opt'})

endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

" load neovim-only plugins
if has('nvim')
  " need to use the bang here otherwise won't work ¯\_(ツ)_/¯
  packadd! deoplete.nvim
  packadd  deoplete-khard
  packadd  deoplete-jedi
  packadd  deoplete-go
  packadd  deoplete-emoji
  packadd  neco-ghc
endif


filetype plugin indent on
syntax on


" options

set encoding=utf-8

" for local .vimrc support
set exrc

set secure
set title
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

" don't redraw while replaying macros
set lazyredraw

set virtualedit=block

set formatoptions+=ncrqjl
set formatoptions-=t " don't auto wrap text - use gq manually
set formatoptions-=a " don't format the entire paragraph automatically

set nostartofline

" single global backup/swp/undo dirs
set backupdir=~/.vim/backup/
" double trailing slash is not a typo
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

" global substitute by default
set gdefault

set noshowmode

set thesaurus+=~/.vim/mthesaur.txt

let g:netrw_browsex_viewer = 'rifle'

" speed up diff syntax highlighting
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
" TODO: remove this because it's annoying when typing a comma separated list
" where spaces aren't allowed
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
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


nnoremap <silent> <leader>zz :silent :call functions#striptrailingwhitespace()<cr>

nnoremap <silent> <leader>se :silent :Sedit<cr>
nnoremap <silent> <leader>st :silent :Stabedit<cr>
nnoremap <silent> <leader>sv :silent :Svsplit<cr>
nnoremap <silent> <leader>ss :silent :Ssplit<cr>

imap <C-h> <BS>
cmap <C-h> <BS>

nnoremap <silent> <leader>K :silent ! $BROWSER https://en.wiktionary.org/wiki/<cword><cr>

" so that enter key also inserts a newline even if popup visible
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"


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

" vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports" "auto-populate imports

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

let g:autocomplete_flow#insert_paren_after_function = 0

" indentLine
let g:indentLine_setConceal = 0
" let g:indentLine_setColors = 0
let g:indentLine_char = '▏'

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0
