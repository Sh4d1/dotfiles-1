
" retrieve and format Signify diff status for statusline
function! local#statusline#sy_stats_wrapper()
  let [l:added, l:modified, l:removed] = sy#repo#get_stats()
  let l:hunkline = ''

  if l:added > 0 || l:modified > 0 || l:removed > 0
    let l:hunkline .= '%#DiffAdd# +' . l:added .
                \ ' %#DiffChange#~' . l:modified .
                \ ' %#DiffDelete#-' . l:removed . ' '

  endif

  return l:hunkline
endfunction

" builds a string designed to be used in the statusline
func! local#statusline#buildstatusline()
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
    if g:ale_running
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
    let l:line .= '%6*%(' . local#statusline#sy_stats_wrapper() . '%)'
  endif

  return l:line
endfunc

