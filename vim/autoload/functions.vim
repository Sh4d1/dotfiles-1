
func! functions#striptrailingwhitespace()
  if !&binary && &filetype != 'diff'

    " save last search
    let _s=@/

    " strip spaces
    %s/\s\+$//e

    " restore position
    normal ``

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

  let l:line .= '%{&ft}'                                         " filetype
  let l:line .= ' %2* '
  let l:line .= '%([%{&fenc}]%)%{&ff}'                           " encodings
  let l:line .= ' %4* '
  let l:line .= '%v,%l/%L [%p%%] '                               " cursor

  let l:ale = ALEGetStatusLine()
  if l:ale =~# '.'
    if l:ale =~# '[E]'
      let l:line .= '%7*%( ' " red
    elseif l:ale =~# '[W]'
      let l:line .= '%3*%( ' " orange
    endif
    let l:line .= l:ale
    let l:line .= ' %)'
  endif

  " git status
  let l:line .= '%6*%( %{fugitive#statusline()} %)'
  let l:hunks = GitGutterGetHunkSummary()
  if l:hunks[0] || l:hunks[1] || l:hunks[2]
    let l:line .= '%#GitGutterAdd# +' . l:hunks[0] .
                        \ ' %#GitGutterChange#~' . l:hunks[1] .
                        \ ' %#GitGutterDelete#-' . l:hunks[2] . ' '
  endif

  return l:line
endfunc


func! functions#vimuxslime()
 call VimuxSendText(@v)
 call VimuxSendKeys('Enter')
endfunc

func! functions#sethighlight()

  " statusline highlights
  hi User1 ctermbg=NONE ctermfg=NONE
  hi User2 ctermbg=2 ctermfg=0
  hi User3 ctermbg=3 ctermfg=0
  hi User4 ctermbg=4 ctermfg=0
  hi User5 ctermbg=5 ctermfg=0
  hi User6 ctermbg=6 ctermfg=0
  hi User7 ctermbg=1 ctermfg=0

  hi link EndOfBuffer ColorColumn

  hi Comment cterm=italic

  " make sure the ale sign column highlighting keeps the same background
  let l:prefix = (has('gui_running') || (has('termguicolors') && &termguicolors) ? 'gui' : 'cterm')
  let l:sign_col_color = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', l:prefix)
  if (l:sign_col_color ==# '')
    let l:sign_col_color = 0
  endif
  execute 'highlight ALEWarningSign ctermfg=3 ' . l:prefix . 'bg=' . l:sign_col_color
  execute 'highlight ALEErrorSign ctermfg=1 ' . l:prefix . 'bg=' . l:sign_col_color

endfunc

" http://dhruvasagar.com/2014/03/11/creating-custom-scratch-buffers-in-vim
" with modifications
function! functions#ScratchEdit(cmd, options)
  silent exe a:cmd tempname() . '-SCRATCH'
  silent setl buftype=nofile
  if !empty(a:options) | silent exe 'setl' a:options | endif
  exe 'normal! ggi# SCRATCH BUFFER'
endfunction

function! functions#toggle_lexima()
  if get(b:, 'lexima_disabled', 0) == 0
    let b:lexima_disabled = 1
    echo 'lexima disabled'
  else
    let b:lexima_disabled = 0
    echo 'lexima enabled'
  endif
endfunction


command! -bar -nargs=* Sedit call functions#ScratchEdit('edit', <q-args>)
command! -bar -nargs=* Ssplit call functions#ScratchEdit('split', <q-args>)
command! -bar -nargs=* Svsplit call functions#ScratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Stabedit call functions#ScratchEdit('tabe', <q-args>)
