" vim-numbertoggle - Automatic toggling between 'hybrid' and absolute line numbers
" Maintainer:        <https://jeffkreeftmeijer.com>
" Version:           2.1.1
" LICENSE:           MIT

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter ?* if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   ?* if &nu | set nornu | endif
augroup END
