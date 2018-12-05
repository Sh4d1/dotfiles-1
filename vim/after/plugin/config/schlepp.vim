" config for the https://github.com/zirrostig/vim-schlepp plugin

if ! exists('g:Schlepp#Loaded')
    finish
endif

vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <left>  <Plug>SchleppLeft
vmap <right> <Plug>SchleppRight
vmap <leader>d       <Plug>SchleppDup
let g:Schlepp#allowSquishingLines = 1
let g:Schlepp#allowSquishingBlock = 1
let g:Schlepp#reindent = 1
