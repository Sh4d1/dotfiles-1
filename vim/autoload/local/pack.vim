
function! local#pack#pack_init() abort

  " auto install minpac if it doesn't exist
  if glob(expand('~/.vim/pack/bundle/opt/minpac')) == ''
    !git clone https://github.com/k-takata/minpac $HOME/.vim/pack/bundle/opt/minpac
  endif

  packadd minpac
  call minpac#init({'package_name': 'bundle'})

  " self manage
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " libraries that are dependencies for other plugins
  " webapi currently only used by rust.vim for :RustPlay
  call minpac#add('https://github.com/mattn/webapi-vim.git', {'type': 'opt'})

  " These are plugins that don't require any config and just make Vim nicer in
  " general.
  "
  " flattened is a solarized colorscheme
  call minpac#add('https://github.com/romainl/flattened.git', {'type': 'opt'})
  call minpac#add('https://github.com/romainl/Apprentice.git', {'type': 'opt'})
  call minpac#add('https://github.com/ap/vim-css-color.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-characterize.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-repeat.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-sleuth.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-eunuch.git', {'type': 'opt'})

  " more focused alternative to vim rsi (readline mappings)
  call minpac#add('https://github.com/vim-utils/vim-husk.git', {'type': 'opt'})

  call minpac#add('https://github.com/tpope/vim-speeddating.git', {'type': 'opt'})
  call minpac#add('https://github.com/machakann/vim-highlightedyank.git', {'type': 'opt'})
  call minpac#add('https://github.com/Yggdroot/indentLine.git', {'type': 'opt'})
  call minpac#add('https://github.com/google/vim-searchindex.git', {'type': 'opt'})
  call minpac#add('https://github.com/roxma/vim-tmux-clipboard.git', {'type': 'opt'})
  call minpac#add('https://github.com/cspeterson/vim-convert.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-commentary.git', {'type': 'opt'})


  " Autoloaded plugins that do have config
  call minpac#add('https://github.com/ludovicchabant/vim-gutentags.git', {'type': 'opt'})
  call minpac#add('https://github.com/luochen1990/rainbow.git', {'type': 'opt'})
  call minpac#add('https://github.com/w0rp/ale.git', {'type': 'opt'})
  call minpac#add('https://github.com/vimwiki/vimwiki.git', {'type': 'opt', 'branch': 'dev'})
  call minpac#add('https://github.com/tbabej/taskwiki.git', {'type': 'opt', 'do': '!pip install --user -U tasklib'})
  call minpac#add('https://github.com/mhinz/vim-startify.git', {'type': 'opt'})
  call minpac#add('https://github.com/machakann/vim-sandwich.git', {'type': 'opt'})
  call minpac#add('https://github.com/AndrewRadev/switch.vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/tommcdo/vim-exchange.git', {'type': 'opt'})
  call minpac#add('https://github.com/wellle/targets.vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/justinmk/vim-sneak.git', {'type': 'opt'})
  call minpac#add('https://github.com/AndrewRadev/splitjoin.vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/AndrewRadev/sideways.vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/mbbill/undotree.git', {'type': 'opt'})
  call minpac#add('https://github.com/justinmk/vim-dirvish.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-scriptease.git', {'type': 'opt'})
  call minpac#add('https://github.com/kshenoy/vim-signature.git', {'type': 'opt'})
  call minpac#add('https://github.com/editorconfig/editorconfig-vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/Valloric/MatchTagAlways.git', {'type': 'opt'})

  call minpac#add('https://github.com/mhinz/vim-signify.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-fugitive.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-rhubarb.git', {'type': 'opt'})
  call minpac#add('https://github.com/junegunn/gv.vim.git', {'type': 'opt'})

  call minpac#add('https://github.com/junegunn/fzf.git', {'type': 'opt', 'do': '!./install --bin'})
  call minpac#add('https://github.com/junegunn/fzf.vim.git', {'type': 'opt'}) " depends on fzf above

  call minpac#add('https://github.com/SirVer/ultisnips.git', {'type': 'opt'})
  call minpac#add('https://github.com/honza/vim-snippets.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-obsession.git', {'type': 'opt'})
  call minpac#add('https://github.com/tommcdo/vim-lion.git', {'type': 'opt'})
  call minpac#add('https://github.com/mattn/emmet-vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-unimpaired.git', {'type': 'opt'})
  call minpac#add('https://github.com/romainl/vim-qf.git', {'type': 'opt'})
  call minpac#add('https://github.com/tpope/vim-abolish.git', {'type': 'opt'})
  call minpac#add('https://github.com/AndrewRadev/linediff.vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/benmills/vimux.git', {'type': 'opt'})
  call minpac#add('https://github.com/wincent/ferret.git', {'type': 'opt'})
  call minpac#add('https://github.com/zirrostig/vim-schlepp.git', {'type': 'opt'})
  call minpac#add('https://github.com/jamessan/vim-gnupg.git', {'type': 'opt'})
  call minpac#add('https://github.com/cespare/vim-toml.git', {'type': 'opt'})
  call minpac#add('https://github.com/lervag/vimtex.git', {'type': 'opt'})
  call minpac#add('https://github.com/wannesm/wmgraphviz.vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/leafgarland/typescript-vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/godlygeek/tabular.git', {'type': 'opt'})
  call minpac#add('https://github.com/tmux-plugins/vim-tmux.git', {'type': 'opt'})
  call minpac#add('https://github.com/fatih/vim-go.git', {'type': 'opt'})
  call minpac#add('https://github.com/pangloss/vim-javascript.git', {'type': 'opt'})
  call minpac#add('https://github.com/mxw/vim-jsx.git', {'type': 'opt'})
  call minpac#add('https://github.com/davidhalter/jedi-vim', {'type': 'opt'})
  call minpac#add('https://github.com/rust-lang/rust.vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/racer-rust/vim-racer.git', {'type': 'opt'})
  call minpac#add('https://github.com/ElmCast/elm-vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/chr4/nginx.vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/ledger/vim-ledger.git', {'type': 'opt'})
  call minpac#add('https://github.com/janko-m/vim-test.git', {'type': 'opt'})
  call minpac#add('https://gitlab.com/Lenovsky/nuake.git', {'type': 'opt'})


  call minpac#add('https://github.com/Shougo/deoplete.nvim.git', {'do': ':UpdateRemotePlugins', 'type': 'opt' })

  " deoplete plugins
  call minpac#add('https://github.com/wokalski/autocomplete-flow', {'type': 'opt'})
  call minpac#add('https://github.com/zchee/deoplete-jedi', {'type': 'opt'})
  call minpac#add('https://github.com/zchee/deoplete-go', {'do': '!make', 'type': 'opt'})
  call minpac#add('https://github.com/fszymanski/deoplete-emoji', {'type': 'opt'})
  call minpac#add('https://github.com/nicoe/deoplete-khard', {'type': 'opt'})
  call minpac#add('https://github.com/eagletmt/neco-ghc', {'type': 'opt'})

endfunction
