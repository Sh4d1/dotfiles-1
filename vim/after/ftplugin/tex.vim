" quick open compiled file
nmap <F5> :silent !zathura "%:r".pdf &<CR>

" for word count
nmap <buffer><silent> <leader>g :VimtexCountWords<CR>

set conceallevel=0
set formatlistpat=^\\s*\\\\\\(end\\\\|item\\)\\>

inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u
