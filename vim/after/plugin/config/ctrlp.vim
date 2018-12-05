" config for ctrlp

if ! exists('g:loaded_ctrlp')
    finish
endif


map <silent> <c-p> :CtrlP<cr>
map <silent> <leader>pp :CtrlP<cr>
map <silent> <leader>pt :CtrlPTag<cr>
map <silent> <leader>pm :CtrlPMRU<cr>
map <silent> <leader>pb :CtrlPBuffer<cr>
