" inspired by https://twitter.com/csswizardry/status/841666536267997185
setlocal colorcolumn=73
setlocal textwidth=72

match ErrorMsg /\%1l.\%>51v/

setlocal spell

" committia
"
" " scroll diff buffer from edit buffer
" " actually don't do this here because these are bad mappings to have if
" " committia isn't running - moved to inside committia hook function
" nmap <buffer><c-d> <Plug>(committia-scroll-diff-down-half)
" nmap <buffer><c-u> <Plug>(committia-scroll-diff-up-half)
