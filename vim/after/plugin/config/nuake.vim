" config for nuake

" no canonical loaded global variable...
if ! exists('g:nuake_position')
    finish
endif

nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>
