
set foldmethod=syntax


" inspiration and code skeleton for text objects below taken from
" https://vimways.org/2018/transactions-pending/

function! s:inAccount()

  let l:magic = &magic
  set magic

  let l:lineNr = line('.')

  let l:pat = '\w\([0-9A-Za-z_:]\| [0-9A-Za-z_:]\)*'

  if (!search('^    ' . l:pat, 'ce', l:lineNr))
    return
  endif

  normal! v

  call search(l:pat, 'cb', l:lineNr)

  let &magic = l:magic
endfunction

" "in account" (entire current account under cursor on current line)
xnoremap <silent> ia :<c-u>call <sid>inAccount()<cr>
onoremap <silent> ia :<c-u>call <sid>inAccount()<cr>

function! s:inAccountSection()

  let l:magic = &magic
  set magic

  let l:lineNr = line('.')

  let l:pat = '\w\(\w\| \w\)*'

  if (!search(l:pat, 'ce', l:lineNr))
    return
  endif

  normal! v

  call search(l:pat, 'cb', l:lineNr)

  let &magic = l:magic
endfunction

" "in category" (select current category under cursor)
xnoremap <silent> ic :<c-u>call <sid>inAccountSection()<cr>
onoremap <silent> ic :<c-u>call <sid>inAccountSection()<cr>

function! s:endAccountSection()

  let l:magic = &magic
  set magic

  let l:lineNr = line('.')

  if (!search(':', 'b', l:lineNr))
    return
  endif

  normal! lv

  call search('\w\([0-9A-Za-z_:]\| [0-9A-Za-z_:]\)*', 'ce', l:lineNr)

  " restore magic
  let &magic = l:magic
endfunction

" "a category" (select category under cursor and all subcategories)
xnoremap <silent> ac :<c-u>call <sid>endAccountSection()<cr>
onoremap <silent> ac :<c-u>call <sid>endAccountSection()<cr>
