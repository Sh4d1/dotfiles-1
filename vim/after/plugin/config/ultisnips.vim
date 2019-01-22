" config for ultisnips (only if ultisnips loaded)

if ! exists('g:did_plugin_ultisnips')
    finish
endif

" disable auto expansion because it's slow and makes insert mode laggy
augroup ultisnips_no_auto_expansion
  au!
  au VimEnter * au! UltiSnips_AutoTrigger
augroup END
