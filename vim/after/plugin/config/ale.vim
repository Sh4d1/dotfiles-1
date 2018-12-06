" config for ale (only if ale loaded)

if ! exists('g:loaded_ale')
    finish
endif

nnoremap <leader>f :ALEFix<cr>
nnoremap <silent> yoa :ALEToggle<cr>
