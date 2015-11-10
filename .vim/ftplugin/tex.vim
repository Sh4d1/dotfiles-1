
" file for latex custom stuff

" let b:tex_flavor = 'pdflatex'
" compiler tex
setlocal makeprg=latexmk\ --silent\ -pdflatex='xelatex\ --shell-escape'\ -pdf\ '%'

" set errorformat=%f:%l:\ %m

"for word count
nmap <buffer><silent> <leader>g :!texcount %<CR>
"for latex clean
nmap <buffer><silent> <leader>c :!latexmk -c<CR>

nmap <F9> :make<CR>
nmap <F5> :silent !okular "%:r".pdf &<CR>

