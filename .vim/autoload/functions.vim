
func! functions#striptrailingwhitespace()
  if !&binary && &filetype != 'diff'

    " save last search
    let _s=@/

    " save position
    normal mz
    normal Hmy

    " strip spaces
    %s/\s\+$//e

    " restore position
    normal 'yz<cr>
    normal `z

    " restore last search
    let @/=_s
  endif
endfunc

func! functions#buildstatusline()
  let l:line = '%3*'
  let l:line .= '%2.{mode()}'                                    " current mode
  let l:line .= ' %1* '
  let l:line .= '%F'                                             " filename
  let l:line .= '%r%m%w%q%h'                                     " flags

  let l:line .= '%1*'
  let l:line .= '%='                                             " separator

  let l:line .= ' %{tagbar#currenttag(''%s « '', '''', ''fs'')}'  " tagbar
  let l:line .= '%{&ft}'                                         " filetype
  let l:line .= ' %2* '
  let l:line .= '%([%{&fenc}]%)%{&ff}'                           " encodings
  let l:line .= ' %4* '
  let l:line .= '%v,%l/%L [%p%%] '                               " cursor

  " git status
  let l:line .= '%6*%( %{fugitive#statusline()} %)'
  let l:hunks = GitGutterGetHunkSummary()
  if l:hunks[0] || l:hunks[1] || l:hunks[2]
    let l:line .= '%#GitGutterAdd# +' . l:hunks[0] .
                        \ ' %#GitGutterChange#~' . l:hunks[1] .
                        \ ' %#GitGutterDelete#-' . l:hunks[2] . ' '
  endif

  return line
endfunc


func! functions#vimuxslime()
 call VimuxSendText(@v)
 call VimuxSendKeys("Enter")
endfunc

func! functions#sethighlight()
  " hi Normal ctermbg=8

  " statusline highlights
  hi User1 ctermbg=NONE ctermfg=NONE
  hi User2 ctermbg=2 ctermfg=0
  hi User3 ctermbg=3 ctermfg=0
  hi User4 ctermbg=4 ctermfg=0
  hi User5 ctermbg=5 ctermfg=0
  hi User6 ctermbg=6 ctermfg=0

  " listchars highlighting
  " hi SpecialKey guibg=red ctermbg=red

  hi link EndOfBuffer ColorColumn
endfunc
