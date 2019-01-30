" Samuel Walladge's Vim config (this vimrc and .vim/*)
" Thanks to the helpful people on #vim (freenode) and /r/vim, the authors of so
" many helpful blog posts, and people who share their config online.

command! PackUpdate call local#pack#pack_init() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call local#pack#pack_init() | call minpac#clean()
command! PackStatus call local#pack#pack_init() | call minpac#status()

" Add all installed plugins to runtime path now to be loaded in the normal
" course of plugin loading. I do this so that I can easily disable a plugin by
" commenting it out here instead of needing to move the directory out of the
" pack/bundle/start directory.

" add packages to runtime path. Comment out to disable packages
packadd! Apprentice
packadd! flattened
packadd! ale
packadd! autocomplete-flow
packadd! elm-vim
packadd! emmet-vim
packadd! ferret
packadd! fzf
packadd! fzf.vim
packadd! gv.vim
packadd! indentLine
packadd! jedi-vim
packadd! linediff.vim
packadd! nginx.vim
packadd! rainbow
packadd! rust.vim
packadd! sideways.vim
packadd! splitjoin.vim
packadd! switch.vim
packadd! tabular
packadd! targets.vim
packadd! typescript-vim
packadd! ultisnips
packadd! vim-snippets
packadd! undotree
packadd! vim-abolish
packadd! vim-characterize
packadd! vim-commentary
packadd! vim-convert
packadd! vim-css-color
packadd! vim-devdocs
packadd! vim-dirvish
packadd! vim-eunuch
packadd! vim-exchange
packadd! vim-fugitive
packadd! vim-gnupg
packadd! vim-go
packadd! vim-gutentags
packadd! vim-highlightedyank
packadd! vim-husk
packadd! vim-javascript
packadd! vim-jsx
packadd! vim-ledger
packadd! vim-lion
packadd! vim-obsession
packadd! vim-qf
packadd! vim-qlist
packadd! vim-racer
packadd! vim-repeat
packadd! vim-rhubarb
packadd! vim-sandwich
packadd! vim-schlepp
packadd! vim-scriptease
packadd! vim-searchindex
packadd! vim-signature
packadd! vim-signify
packadd! vim-sleuth
packadd! vim-sneak
packadd! vim-speeddating
packadd! vim-test
packadd! vim-tmux
packadd! vim-tmux-clipboard
packadd! vim-toml
packadd! vim-unimpaired
packadd! vim-editorconfig
packadd! vimtex
packadd! vimux
packadd! webapi-vim
packadd! wmgraphviz.vim

" load neovim-only plugins
if has('nvim')
  packadd! deoplete.nvim
  packadd! deoplete-khard
  packadd! deoplete-jedi
  packadd! deoplete-go
  packadd! deoplete-emoji
  packadd! neco-ghc
endif

set nocompatible
filetype plugin indent on
syntax on

set encoding=utf-8

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

set listchars=tab:»·,trail:•,nbsp:•,extends:»,precedes:«
set list

set wildmenu
set shortmess+=filnxtToOc " less 'press ... to continue' maybe
set showmode
set breakindent
set showbreak=…

" spelling options
set nospell
set spelllang=en_au
set spellcapcheck=

" don't redraw while replaying macros
set lazyredraw

set virtualedit=block

set formatoptions+=ncrqjl
" set formatoptions-=t " don't auto wrap text - use gq manually
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

set completeopt=menu,preview

" always show to avoid visual interruptions
set signcolumn=yes

" who needs mouse support :P
set mouse=

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

" global substitute by default
set gdefault

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

" Status Line
set laststatus=2
set statusline=%!local#statusline#buildstatusline()

" neovim python provider
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'


" Keymappings

" readonly save trick
" cmap w!! w !sudo tee % >/dev/null

cnoremap <c-p> <up>
cnoremap <c-n> <down>

" use esc in normal mode to reset things - hide search highlighting, redraw the
" screen, write out all buffers, and write the current buffer (so BufWritePost
" is fired; to trigger tools like ALE to relint)
" NOTE: can't remap <esc> in Vim without also `set noesckeys` and enduring pain
if has('nvim')
  nnoremap <silent> <esc> <esc>:<c-u>nohlsearch \| redraw! \| silent! wa \| silent! w<cr>
endif

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

" run a macro on selected lines - press @, then the register name, then <enter>
" xnoremap @ :normal @

" undotree
nmap <silent> <leader>u :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1

" NVIM terminal specific stuff
if has('nvim')
  " TODO: work out nice mappings
  " tnoremap <m-space> <c-\><c-n>
  " augroup vimrc_nvim_term
  "   autocmd!
  " XXX: https://github.com/neovim/neovim/issues/8691
  "   " autocmd BufEnter term://* startinsert!
  "   " autocmd BufLeave term://* stopinsert
  "   autocmd BufEnter * if &buftype == 'terminal' | :startinsert! | endif
  "   autocmd BufLeave * if &buftype == 'terminal' | :stopinsert | endif
  " augroup END
endif

nnoremap <silent> du :diffupdate<CR>

" Sideways
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

nnoremap <silent> >, :silent :SidewaysRight<cr>
nnoremap <silent> <, :silent :SidewaysLeft<cr>


nnoremap <silent> <leader>zz :silent :call local#functions#striptrailingwhitespace()<cr>

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

command! -bar -nargs=* Sedit call local#scratch#edit('edit', <q-args>)
command! -bar -nargs=* Ssplit call local#scratch#edit('split', <q-args>)
command! -bar -nargs=* Svsplit call local#scratch#edit('vsplit', <q-args>)
command! -bar -nargs=* Stabedit call local#scratch#edit('tabe', <q-args>)

nnoremap <silent> <leader>se :silent :Sedit<cr>
nnoremap <silent> <leader>st :silent :Stabedit<cr>
nnoremap <silent> <leader>sv :silent :Svsplit<cr>
nnoremap <silent> <leader>ss :silent :Ssplit<cr>

nnoremap <silent> <leader>K :silent ! $BROWSER https://en.wiktionary.org/wiki/<cword><cr>

" so that enter key also inserts a newline even if popup visible
imap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"


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
  " autocmd BufHidden,FocusLost,InsertLeave ?* nested silent! wa
  autocmd ColorScheme * call local#functions#sethighlight()
  autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif
augroup END

" graphviz
let g:WMGraphviz_viewer = 'rifle'

" gnupg
let g:GPGPossibleRecipients=[
      \"Samuel Walladge <samuel@swalladge.id.au>",
      \]

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

let g:editorconfig_blacklist = {
    \ 'filetype': ['git.*', 'fugitive'],
    \ 'pattern': ['\.un~$']}

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

" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_change = '~'

" Finally set the colorscheme. Set at the end so previous autocmds are trigger
try
  colorscheme flattened_dark
catch
  " the colorscheme fallback if none installed
  colorscheme torte
endtry
