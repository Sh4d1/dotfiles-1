" config for highlightedyank https://github.com/machakann/vim-highlightedyank

if ! exists("g:loaded_highlightedyank")
    finish
endif

" map if older vim version
if ! exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif
