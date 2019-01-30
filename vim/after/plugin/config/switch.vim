" config for switch

if ! exists('g:loaded_switch')
    finish
endif

" Switch
let g:switch_custom_definitions =
  \ [
  \   switch#NormalizedCase(['left', 'right']),
  \   switch#NormalizedCase(['on', 'off']),
  \   [0, 1]
  \ ]
