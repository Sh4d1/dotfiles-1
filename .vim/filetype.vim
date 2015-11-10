if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
  au! BufNewFile,BufRead *.cool,*.cl set filetype=cool 
  au! BufRead,BufNewFile *.vala,*.vapi setfiletype vala
augroup END
