" config for Ferret

if ! exists('g:FerretLoaded')
    finish
endif

" Ferret
let g:FerretMap = 0
let g:FerrerLazyInit=0
nmap <leader>aa <Plug>(FerretAck)
nmap <leader>ar <Plug>(FerretAcks)
nmap <leader>aw <Plug>(FerretAckWord)
nmap <leader>al <Plug>(FerretLack)
