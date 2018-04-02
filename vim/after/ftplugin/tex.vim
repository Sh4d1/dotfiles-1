" quick open compiled file
nnoremap <F5> :silent !zathura "%:r".pdf &<CR>

" for word count
nnoremap <buffer><silent> <leader>lw :VimtexCountWords<CR>


set conceallevel=0
set formatlistpat=^\\s*\\\\\\(end\\\\|item\\)\\>

" save undo checkpoint after each sentence or phrase
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u
inoremap , ,<C-g>u
