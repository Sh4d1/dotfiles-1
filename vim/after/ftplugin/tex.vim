" quick open compiled file
nnoremap <buffer><F5> :silent !zathura "%:r".pdf &<CR>

set conceallevel=0
set formatlistpat=^\\s*\\\\\\(end\\\\|item\\)\\>

" save undo checkpoint after each sentence or phrase
inoremap <buffer>. .<C-g>u
inoremap <buffer>! !<C-g>u
inoremap <buffer>? ?<C-g>u
inoremap <buffer>: :<C-g>u
inoremap <buffer>, ,<C-g>u
