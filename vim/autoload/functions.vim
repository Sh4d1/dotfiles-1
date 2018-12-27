

" this is so the status line function can check if ale is running or not
let s:ale_running = 0
augroup ALEProgress
  autocmd!
  autocmd User ALELintPre  let s:ale_running = 1 | redrawstatus
  autocmd User ALELintPost let s:ale_running = 0 | redrawstatus
augroup end

" retrieve and format Signify diff status for statusline
function! functions#sy_stats_wrapper()
  let [l:added, l:modified, l:removed] = sy#repo#get_stats()
  let l:hunkline = ''

  if l:added > 0 || l:modified > 0 || l:removed > 0
    let l:hunkline .= '%#DiffAdd# +' . l:added .
                \ ' %#DiffChange#~' . l:modified .
                \ ' %#DiffDelete#-' . l:removed . ' '

  endif

  return l:hunkline
endfunction

" Strip trailing whitespace. Only works if not in binary mode and excludes
" certain filetypes.
func! functions#striptrailingwhitespace()
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

" builds a string designed to be used in the statusline
func! functions#buildstatusline()
  let l:line = '%9*'
  let l:line .= '%F'                                             " filename
  let l:line .= '%r%m%w%q%h'                                     " flags

  let l:line .= ' %9* '
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

  if exists('g:loaded_ale')
    if s:ale_running
      let l:line .= '%2*%( [lint] %)'
    else
      let l:ale = ale#statusline#Count(bufnr('%'))
      if l:ale.total > 0
        if l:ale.error > 0
          let l:line .= '%1*%( ' " red
        else
          let l:line .= '%3*%( ' " orange
        endif
        let l:line .= printf('E:%d W:%d', l:ale.error + l:ale.style_error, l:ale.warning + l:ale.style_warning + l:ale.info)
        let l:line .= ' %)'
      else
        let l:line .= '%2*%( [ OK ] %)'
      endif
    endif
  endif

  " git status
  if exists('g:loaded_fugitive')
    let l:line .= '%6*%( %{fugitive#statusline()} %)'
  endif

  if exists('g:loaded_signify')
    let l:line .= '%6*%(' . functions#sy_stats_wrapper() . '%)'
  endif

  return l:line
endfunc


func! functions#sethighlight()


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
