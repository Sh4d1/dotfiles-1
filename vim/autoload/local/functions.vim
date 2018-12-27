

" Strip trailing whitespace. Only works if not in binary mode and excludes
" certain filetypes.
func! local#functions#striptrailingwhitespace()
  if !&binary && &filetype !=# 'diff' && &filetype !=# 'mail'

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


func! local#functions#sethighlight()


  " statusline highlights
  hi User1 ctermbg=1 ctermfg=0 guifg='#073642' guibg='#dc322f'
  hi User2 ctermbg=2 ctermfg=0 guifg='#073642' guibg='#859900'
  hi User3 ctermbg=3 ctermfg=0 guifg='#073642' guibg='#b58900'
  hi User4 ctermbg=4 ctermfg=0 guifg='#073642' guibg='#268bd2'
  hi User5 ctermbg=5 ctermfg=0 guifg='#073642' guibg='#d33682'
  hi User6 ctermbg=6 ctermfg=0 guifg='#073642' guibg='#2aa198'
  hi User9 ctermbg=NONE ctermfg=NONE

  " custom highlight improvements
  hi link EndOfBuffer ColorColumn
  hi Comment cterm=italic

  " make sure the ale sign column highlighting keeps the same background
  if exists('g:loaded_ale')
    let l:prefix = (has('gui_running') || (has('termguicolors') && &termguicolors) ? 'gui' : 'cterm')
    let l:sign_col_color = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', l:prefix)
    if (l:sign_col_color ==# '')
      let l:sign_col_color = 0
    endif

    execute 'highlight ALEWarningSign ctermfg=3 ' . l:prefix . 'bg=' . l:sign_col_color
    execute 'highlight ALEErrorSign ctermfg=1 ' . l:prefix . 'bg=' . l:sign_col_color
  endif

endfunc
