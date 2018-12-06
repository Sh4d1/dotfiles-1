" config for switch

if ! exists('g:loaded_switch')
    finish
endif

" Switch
let g:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['left', 'right']),
  \   [0, 1]
  \ ]
