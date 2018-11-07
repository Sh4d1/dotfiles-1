
let s:ale_running = 0
augroup ALEProgress
  autocmd!
  autocmd User ALELintPre  let s:ale_running = 1 | redrawstatus
  autocmd User ALELintPost let s:ale_running = 0 | redrawstatus
augroup end

func! functions#striptrailingwhitespace()
  if !&binary && &filetype !=# 'diff'

    " save last search
    let l:_s=@/

    " strip spaces
    %s/\s\+$//e

    " restore position
    normal ``

    " restore last search
    let @/=l:_s
  endif
endfunc

function! functions#sy_stats_wrapper()
  let l:symbols = ['+', '-', '~']
  let [l:added, l:modified, l:removed] = sy#repo#get_stats()
  let l:stats = [l:added, l:removed, l:modified]  " reorder
  let l:hunkline = ''

  for l:i in range(3)
    if l:stats[l:i] > 0
      let l:hunkline .= printf('%s%s ', l:symbols[l:i], l:stats[l:i])
    endif
  endfor

  if !empty(l:hunkline)
    let l:hunkline = printf('[%s]', l:hunkline[:-2])
  endif

  return l:hunkline
endfunction

func! functions#buildstatusline()
  let l:line = '%1*'
  let l:line .= '%F'                                             " filename
  let l:line .= '%r%m%w%q%h'                                     " flags

  let l:line .= ' %1* '
  let l:line .= '%='                                             " separator

  " show keymap
  " let l:line .= '%6*%( %k%)'

  let l:line .= ' %3* '
  let l:line .= '%{&ft}'                                         " filetype
  let l:line .= ' %4* '
  let l:line .= '%([%{&fenc}]%)%{&ff}'                           " encodings
  let l:line .= ' %3* '
  let l:line .= '%n' " buffer number
  let l:line .= ' %4* '
  let l:line .= '%v,%l/%L [%p%%] '                               " cursor

  if s:ale_running
    let l:line .= '%1*%( ale… %)'
  else
    let l:ale = ale#statusline#Count(bufnr('%'))
    if l:ale.total > 0
      if l:ale.error > 0
        let l:line .= '%7*%( ' " red
      else
        let l:line .= '%3*%( ' " orange
      endif
      let l:line .= printf('E:%d W:%d', l:ale.error + l:ale.style_error, l:ale.warning + l:ale.style_warning + l:ale.info)
      let l:line .= ' %)'
    else
      let l:line .= '%2*%( ale :) %)'
    endif
  endif


  " git status
  let l:line .= '%6*%( %{fugitive#statusline()} %)'

  " signify
  " let l:line .= '%2*%( %{functions#sy_stats_wrapper()} %)'

  " gitgutter
  " TODO: this always gets stats for currently focused buffer
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
  hi User2 ctermbg=2 ctermfg=0 guifg='#073642' guibg='#859900'
  hi User3 ctermbg=3 ctermfg=0 guifg='#073642' guibg='#b58900'
  hi User4 ctermbg=4 ctermfg=0 guifg='#073642' guibg='#268bd2'
  hi User5 ctermbg=5 ctermfg=0 guifg='#073642' guibg='#d33682'
  hi User6 ctermbg=6 ctermfg=0 guifg='#073642' guibg='#2aa198'
  hi User7 ctermbg=1 ctermfg=0 guifg='#073642' guibg='#dc322f'

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
  " use a system provided temporary file
  " this will be persistent after quitting vim (won't accidentally lose data)
  " won't be persistent across reboots (probably) - see `man mktemp` for how to
  " specify a temporary file location if required
  let l:file = system('mktemp -t nvim-scratch-XXXXX.md')
  silent exe a:cmd l:file
  " silent setl buftype=nofile
  if !empty(a:options) | silent exe 'setl' a:options | endif
  " exe 'normal! ggi# SCRATCH BUFFER'
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
