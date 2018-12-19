

augroup vimwiki_local
  autocmd!
  " autocmds for better/more automatic syncing of taskwiki
  " avoids the case where I may change a task in X and then gets overwritten by Y
  autocmd FocusGained ?* :silent TaskWikiBufferLoad
  autocmd FocusLost,BufHidden ?* :silent TaskWikiBufferSave
augroup END


nnoremap <silent><buffer> <leader><space> :VimwikiToggleListItem<cr>
vnoremap <silent><buffer> <leader><space> :VimwikiToggleListItem<cr>

" remap due to clobbering my other mapping.
" requires fzf
nnoremap <silent><buffer> <c-space> :Files<cr>

" disable fzf tags mapping
map <silent><buffer> <leader>t <nop>

" setlocal foldmethod=manual
setlocal spell

setlocal foldlevel=2


" fix bad default header level mappings
noremap <buffer> = =
noremap <buffer> + +
nmap <buffer> <leader>< <Plug>VimwikiRemoveHeaderLevel
nmap <buffer> <leader>> <Plug>VimwikiAddHeaderLevel

" reassign default dirvish mapping
map <silent><buffer> - <Plug>(dirvish_up)

" TODO: colour these nicely
" hi VimwikiHeader1 guifg=#FF0000
" hi VimwikiHeader2 guifg=#00FF00
" hi VimwikiHeader3 guifg=#0000FF
" hi VimwikiHeader4 guifg=#FF00FF
" hi VimwikiHeader5 guifg=#00FFFF
" hi VimwikiHeader6 guifg=#FFFF00


inoremap <silent><buffer> <m-cr> <cr>
