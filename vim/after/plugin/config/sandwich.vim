" config for sandwich

if ! exists('g:loaded_sandwich')
    finish
endif

" vim-surround style keymappings
runtime macros/sandwich/keymap/surround.vim

" these aren't super useful in my workflow and I prefer to be able to `das` to
" delete a sentence
vunmap as
ounmap as
vunmap is
ounmap is

" also I use surround style keymappings, so these can go
unmap sa
unmap sd
unmap sdb
unmap sr
unmap srb
