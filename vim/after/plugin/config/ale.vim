" config for ale (only if ale loaded)

if ! exists('g:loaded_ale')
    finish
endif

" this is so the status line function can check if ale is running or not
augroup ALEProgress
  autocmd!
  autocmd User ALELintPre  let g:ale_running = 1 | redrawstatus
  autocmd User ALELintPost let g:ale_running = 0 | redrawstatus
augroup end


nnoremap <silent> yoa :ALEToggle<cr>
