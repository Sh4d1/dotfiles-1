" gutentags config

let g:gutentags_cache_dir = expand('~/.local/share/nvim/gutentags/')

let g:gutentags_file_list_command = {
            \ 'markers': {
            \ '.git': 'git ls-files',
            \ '.hg': 'hg files',
            \ },
      \ }
