
func! local#zettel#edit(cmd, ...)
  let l:sep = ''
  if len(a:000) > 0
    let l:sep = '-'
  endif

  let l:fname = expand('~/wiki/') . strftime("%F-%H%M") . l:sep . join(a:000, '-') . '.wiki'

  exec a:cmd . " " . l:fname
  if len(a:000) > 0
    exec "normal Go\<c-u>datetime\<c-space> " . join(a:000) . "\<cr>\<cr>\<esc>"
  else
    exec "normal Go\<c-u>datetime\<c-space>\<cr>\<cr>\<esc>"
  endif
endfunc
