
set fo-=o

" rust racer mappings
nmap gd <Plug>(rust-def)
nmap K  <Plug>(rust-doc)

" EXEC: rustfmt
setlocal formatprg=rustfmt
setlocal equalprg=rustfmt
