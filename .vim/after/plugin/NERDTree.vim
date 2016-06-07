" NERDtree
let g:NERDTreeCreatePrefix='keepalt silent keepjumps'
" https://github.com/wincent/wincent/blob/master/roles/dotfiles/files/.vim/autoload/autocmds.vim
function! Attempt_select_last_file() abort
  let l:previous=expand('#:t')
  if l:previous != ''
    call search('\v<' . l:previous . '>')
  endif
endfunction
augroup NERDTreeAutocmds
  autocmd!
  autocmd User NERDTreeInit call Attempt_select_last_file()
augroup END
