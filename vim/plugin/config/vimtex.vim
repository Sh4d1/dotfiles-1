" vimtex config

let g:vimtex_latexmk_options = '-pdflatex="xelatex --shell-escape" -pdf'
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'

let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_mode = 0
let g:vimtex_quickfix_open_on_warning = 0
