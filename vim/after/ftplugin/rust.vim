
set fo-=o

" rust racer mappings
nmap gd <Plug>(rust-def)
nmap gV <Plug>(rust-def-vertical)
nmap K  <Plug>(rust-doc)

" EXEC: rustfmt
setlocal formatprg=rustfmt
setlocal equalprg=rustfmt
