" config for fzf.vim

if ! exists(':FZF')
    finish
endif

map <silent> <c-space> :Files<cr>
map <silent> <leader>t :Tags<cr>
map <silent> <leader>m :Marks<cr>

let g:fzf_layout = { 'down': '~20%' }
