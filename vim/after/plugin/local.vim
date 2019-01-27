
" wiki config

" fuzzy find wiki pages
if exists(':FZF')
  map <silent> <leader>ww :FZF ~/wiki<cr>
endif

" jump to wiki index
map <silent> <leader>wi :e ~/wiki/index.md<cr>

" edit today diary note
map <silent> <leader>w<leader>w :e ~/wiki/diary/<c-r>=strftime('%Y-%m-%d')<cr>.md<cr>

" create wiki page
map <leader>wc :<c-u>e ~/wiki/.md<left><left><left>
