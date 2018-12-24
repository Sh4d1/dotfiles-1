" vimwiki config. This must be set before vimwiki is loaded

let g:vimwiki_list = [
    \ {
      \ 'path': '~/wiki/',
      \ 'path_html': '~/wiki_html/',
      \ 'auto_toc': 1,
      \ 'index': 'index',
      \ 'automatic_nested_syntaxes': 1,
      \ 'template_path': '~/wiki/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'css_name': 'style.css',
      \ 'auto_tags': 1,
    \ },
    \ {
      \ 'path': '~/.nextcloud-notes/',
      \ 'auto_toc': 1,
      \ 'index': 'index',
      \ 'automatic_nested_syntaxes': 1,
      \ 'ext': '.txt',
      \ 'syntax': 'markdown',
      \ 'auto_tags': 1,
    \ }
  \ ]

let g:vimwiki_folding = 'expr'
let g:vimwiki_auto_chdir = 1
let g:vimwiki_hl_headers = 1
let g:vimwiki_dir_link = 'index'

let g:taskwiki_disable_concealcursor = 'yes'
" i want to manage mk/load views myself
let g:taskwiki_dont_preserve_folds = 'yes'
let g:vimwiki_global_ext = 0
