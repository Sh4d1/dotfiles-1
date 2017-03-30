
setlocal makeprg=g++\ -Wall\ -std=c++11\ -o\ '%:r'\ '%'
nnoremap <F9> :make!<cr>
nnoremap <F5> :!./"%:r"<cr>

