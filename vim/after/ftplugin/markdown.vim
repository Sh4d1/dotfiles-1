
" pressing enter with region selected turns it into a link
" useful for my wiki pages
xmap <buffer> <cr> S]"tyi]f]a()<esc>:let @t = substitute(@t, ' ', '-', 'g')<cr>"tP

set suffixesadd=.md,.markdown,.txt

set conceallevel=0

set spell

" https://www.reddit.com/r/vim/comments/ni0c2/vim_for_prose_what_are_your_tips/c39d88v/
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u

let g:markdown_fenced_languages = ['python', 'c', 'javascript', 'json']
