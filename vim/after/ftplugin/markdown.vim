
" pressing enter with region selected turns it into a link
" useful for my wiki pages
xmap <buffer> <cr> S]"tyi]f]a()<esc>:let @t = substitute(@t, ' ', '-', 'g')<cr>"tP

nmap <buffer> ge :e <cfile>.md<cr>

" useful for wikis
set suffixesadd=.md,.markdown
