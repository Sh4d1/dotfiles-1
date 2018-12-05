
" http://dhruvasagar.com/2014/03/11/creating-custom-scratch-buffers-in-vim
" with modifications

function! s:scratch_edit(cmd, options)
  " use a system provided temporary file
  " this will be persistent after quitting vim (won't accidentally lose data)
  " won't be persistent across reboots (probably) - see `man mktemp` for how to
  " specify a temporary file location if required
  let l:file = system('mktemp -t nvim-scratch-XXXXX.md')
  silent exe a:cmd l:file
  if !empty(a:options) | silent exe 'setl' a:options | endif
endfunction


command! -bar -nargs=* Sedit call <SID>scratch_edit('edit', <q-args>)
command! -bar -nargs=* Ssplit call <SID>scratch_edit('split', <q-args>)
command! -bar -nargs=* Svsplit call <SID>scratch_edit('vsplit', <q-args>)
command! -bar -nargs=* Stabedit call <SID>scratch_edit('tabe', <q-args>)
