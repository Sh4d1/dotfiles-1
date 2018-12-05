" config for vimux https://github.com/benmills/vimux

if ! exists('g:loaded_vimux')
    finish
endif


func s:vimux_slime()
 call VimuxSendText(@v)
 call VimuxSendKeys('Enter')
endfunc


" If text is selected, save it in the v register and send that register to tmux
vmap <C-c><C-c> "vy :call <SID>vimux_slime()<cr>

" Select current paragraph and send it to tmux
nmap <C-c><C-c> vip<C-c><C-c>

" Prompt for a command to run
map <leader>bp :VimuxPromptCommand<cr>

" Run last command executed by VimuxRunCommand
map <leader>bl :silent! wa <bar> :VimuxRunLastCommand<cr>

" Inspect runner pane
map <leader>bo :call VimuxOpenRunner()<cr>

" Inspect runner pane
map <leader>bi :VimuxInspectRunner<cr>

" Close vim tmux runner opened by VimuxRunCommand
map <leader>bq :VimuxCloseRunner<cr>

" Interrupt any command running in the runner pane
map <leader>bc :VimuxInterruptRunner<cr>

" send eof
map <leader>bd :call VimuxSendKeys("^D")<cr>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <leader>bz :call VimuxZoomRunner()<cr>

