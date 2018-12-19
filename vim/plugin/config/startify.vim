" startify config

let g:startify_enable_special         = 1
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 0
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ $HOME . '/.vim/plugged/.*',
      \ ]

let g:startify_bookmarks = [
      \ { 'v': '~/.vimrc' },
      \ { 'z': '~/.zshrc' },
      \ ]

let g:startify_custom_header = [ '   VIM' ]

let g:startify_custom_footer =
      \ ['', "   Vim is charityware. Run ':h iccf' for more information.", '']

let g:startify_commands = [
      \ {'S': 'Sedit'},
      \ {'T': 'VimwikiMakeDiaryNote'},
      \ {'U': 'PackUpdate'},
      \ {'V': 'GV'},
      \ {'W': 'VimwikiIndex'},
      \ ]


augroup startify_config
  autocmd!
  autocmd! User Startified setlocal cursorline buftype=nofile
augroup END
