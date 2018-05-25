

augroup vimwiki_local
  autocmd!
  " autocmds for better/more automatic syncing of taskwiki
  " avoids the case where I may change a task in X and then gets overwritten by Y
  autocmd FocusGained ?* :silent TaskWikiBufferLoad
  autocmd FocusLost,BufHidden ?* :silent TaskWikiBufferSave
augroup END


" remap due to clobbering my other mapping
nnoremap <silent><buffer> coi :VimwikiToggleListItem<cr>
nnoremap <silent><buffer> <c-space> :Files<cr>


" fix bad default header level mappings
noremap <buffer> = =
noremap <buffer> + +
nmap <buffer> <leader>< <Plug>VimwikiRemoveHeaderLevel
nmap <buffer> <leader>> <Plug>VimwikiAddHeaderLevel

" reassign default dirvish mapping
nnoremap <silent><buffer> - :Dirvish<cr>

" disable fzf tags mapping here
map <silent><buffer> <leader>t <nop>
