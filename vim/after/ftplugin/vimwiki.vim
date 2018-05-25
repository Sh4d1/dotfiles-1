

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
map <silent><buffer> - <Plug>(dirvish_up)

" disable fzf tags mapping here
map <silent><buffer> <leader>t <nop>

" TODO: colour these nicely
" hi VimwikiHeader1 guifg=#FF0000
" hi VimwikiHeader2 guifg=#00FF00
" hi VimwikiHeader3 guifg=#0000FF
" hi VimwikiHeader4 guifg=#FF00FF
" hi VimwikiHeader5 guifg=#00FFFF
" hi VimwikiHeader6 guifg=#FFFF00

