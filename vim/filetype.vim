if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead .tmux.conf*,tmux.conf*     setf tmux
  au! BufNewFile,BufRead *.m,*.oct                  setf octave
  au! BufNewFile,BufRead *.cool,*.cl                setf cool
  au! BufNewFile,BufRead *.vala,*.vapi              setf vala
  au! BufNewFile,BufRead *.raml                     setf yaml
  au! BufNewFile,BufRead *.rs                       setf rust
  au! BufNewFile,BufRead /tmp/mutt*                 setf mail
  au! BufNewFile,BufRead /tmp/neomutt*              setf mail
  au! BufNewFile,BufRead *.tsx                      setf typescript.jsx
  " for vim-ghost (GhostText)
  au! BufNewFile,BufRead /tmp/*ghost*.txt           setf markdown
augroup END
