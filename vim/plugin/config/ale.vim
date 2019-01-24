" ale config

" locally defined for use in statusline
let g:ale_running = 0

let g:ale_sign_error = '×'
let g:ale_sign_warning = '!'
let g:ale_sign_info = 'ℹ'

let g:ale_linters = {
      \ 'java': [],
      \ 'python': ['pylint'],
      \ 'javascript': ['flow'],
      \ 'typescript': ['tslint'],
      \ 'elm': [],
      \ 'text': ['vale', 'proselint'],
      \ 'tex': ['vale', 'proselint'],
      \ 'markdown': ['proselint', 'mdl', 'vale'],
      \ 'kotlin': ['kotlinc'],
      \ 'haskell': [],
      \ 'ledger': ['ledger']
      \ }

let g:ale_fixers = {
      \ 'javascript': [
      \    'eslint'
      \ ],
      \ 'typescript': [
      \    'tslint'
      \ ],
      \ 'python': [
      \    'black',
      \    'isort'
      \ ],
      \ 'css': [
      \    'prettier'
      \ ],
      \ 'rust': [
      \    'rustfmt'
      \ ],
      \ 'c': [
      \    'clang-format'
      \ ],
      \ }

let g:ale_c_clangeformat_options = '-style=Mozilla'
