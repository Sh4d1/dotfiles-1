# TODO: port to salt

- name: vim | set up directories
  file: path={{ ansible_env.HOME }}/{{ item }} state=directory mode="0750"
  with_items:
    - .vim/after/ftplugin
    - .vim/autoload
    - .vim/backup
    - .vim/ftdetect
    - .vim/plugged
    - .vim/spell
    - .vim/swp
    - .vim/syntax
    - .vim/undo
    - .vim/UltiSnips

- name: vim | copy files
  copy: src={{ item.src }} dest={{ ansible_env.HOME }}/{{ item.dest }} mode={{ item.mode | default("0640") }}
  with_items:
    - { src: '.vim/after/ftplugin/cpp.vim', dest: '.vim/after/ftplugin/cpp.vim' }
    - { src: '.vim/after/ftplugin/html.vim', dest: '.vim/after/ftplugin/html.vim' }
    - { src: '.vim/after/ftplugin/java.vim', dest: '.vim/after/ftplugin/java.vim' }
    - { src: '.vim/after/ftplugin/mail.vim', dest: '.vim/after/ftplugin/mail.vim' }
    - { src: '.vim/after/ftplugin/octave.vim', dest: '.vim/after/ftplugin/octave.vim' }
    - { src: '.vim/after/ftplugin/python.vim', dest: '.vim/after/ftplugin/python.vim' }
    - { src: '.vim/after/ftplugin/qf.vim', dest: '.vim/after/ftplugin/qf.vim' }
    - { src: '.vim/after/ftplugin/tex.vim', dest: '.vim/after/ftplugin/tex.vim' }
    - { src: '.vim/after/ftplugin/xml.vim', dest: '.vim/after/ftplugin/xml.vim' }
    - { src: '.vim/autoload/functions.vim', dest: '.vim/autoload/functions.vim' }
    - { src: '.vim/autoload/plug.vim', dest: '.vim/autoload/plug.vim' }
    - { src: '.vim/filetype.vim', dest: '.vim/filetype.vim' }
    - { src: '.vim/ftdetect/raml.vim', dest: '.vim/ftdetect/raml.vim' }
    - { src: '.vim/syntax/cool.vim', dest: '.vim/syntax/cool.vim' }
    - { src: '.vim/syntax/octave.vim', dest: '.vim/syntax/octave.vim' }
    - { src: '.vim/syntax/tmux.vim', dest: '.vim/syntax/tmux.vim' }
    - { src: '.vim/syntax/vala.vim', dest: '.vim/syntax/vala.vim' }
    - { src: '.vimrc', dest: '.vimrc' }

- name: vim | copy ultisnips files
  copy: src={{ item }} dest={{ ansible_env.HOME }}/.vim/UltiSnips
  with_fileglob:
    - .vim/UltiSnips/*

- name: vim | link neovim config
  file: src={{ ansible_env.HOME }}/{{ item.src }} dest={{ ansible_env.HOME }}/{{ item.dest }} state=link
  with_items:
    - { src: '.vimrc', dest: '.vim/init.vim' }
    - { src: '.vim', dest: '.config/nvim' }

