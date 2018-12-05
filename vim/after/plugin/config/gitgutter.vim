" config for gitgutter

if ! exists('g:loaded_gitgutter')
    finish
endif

" hunk text objects
omap ic <Plug>GitGutterTextObjectInnerPending
omap ac <Plug>GitGutterTextObjectOuterPending
xmap ic <Plug>GitGutterTextObjectInnerVisual
xmap ac <Plug>GitGutterTextObjectOuterVisual

