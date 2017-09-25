
" pressing enter with region selected turns it into a link
" useful for my wiki pages
xmap <buffer> <cr> S]"tyi]f]a()<esc>:let @t = substitute(@t, ' ', '-', 'g')<cr>"tP

set suffixesadd=.md,.markdown,.txt
