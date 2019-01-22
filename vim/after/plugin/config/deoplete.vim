" config for Deoplete

if ! exists('g:loaded_deoplete')
    finish
endif


function! s:check_back_space() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()

inoremap <silent><expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif


call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

" " for triggering vimwiki link omnicompletion
" call deoplete#custom#var('omni', 'input_patterns', {
"     \ 'vimwiki': '\[\[[^\s]*',
"     \})

" deoplete plugins

" XXX: assumes vimtex installed
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
