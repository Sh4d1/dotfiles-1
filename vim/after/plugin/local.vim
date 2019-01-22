
" wiki
if exists(':FZF')
  map <silent> <leader>ww :FZF ~/wiki<cr>
endif

" jump to wiki index
map <silent> <leader>wi :e ~/wiki/index.md<cr>

" edit today diary note
map <silent> <leader>wt :e ~/wiki/diary/<c-r>=strftime('%Y-%m-%d')<cr>.md<cr>
