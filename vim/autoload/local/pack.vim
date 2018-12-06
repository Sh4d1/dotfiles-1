
function! local#pack#pack_init() abort
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
