if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead .tmux.conf*,tmux.conf*     setf tmux
  au! BufNewFile,BufRead *.m,*.oct                  setf octave
  au! BufNewFile,BufRead *.cool,*.cl                setf cool 
  au! BufNewFile,BufRead *.vala,*.vapi              setf vala
  au! BufNewFile,BufRead *.raml                     setf yaml
augroup END
