
vim backup dir exists:
  file.directory:
    - name: {{ grains['HOME'] }}/.vim/backup
    - makedirs: true
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

vim swp dir exists:
  file.directory:
    - name: {{ grains['HOME'] }}/.vim/swp
    - makedirs: true
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

vim spell dir exists:
  file.directory:
    - name: {{ grains['HOME'] }}/.vim/spell
    - makedirs: true
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

vim undo dir exists:
  file.directory:
    - name: {{ grains['HOME'] }}/.vim/undo
    - makedirs: true
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy .vim directory:
  file.recurse:
    - name: {{ grains['HOME'] }}/.vim/
    - source: salt://files/.vim/
    - makedirs: true
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy .vimrc:
  file.managed:
    - name: {{ grains['HOME'] }}/.vimrc
    - source: salt://files/.vimrc
    - template: jinja
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

symlink neovim config dir:
  file.symlink:
    - name: {{ grains['HOME'] }}/.config/nvim
    - target: {{ grains['HOME'] }}/.vim
    - makedirs: true
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

symlink neovim config file:
  file.symlink:
    - name: {{ grains['HOME'] }}/.vim/init.vim
    - target: {{ grains['HOME'] }}/.vimrc
    - makedirs: true
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
