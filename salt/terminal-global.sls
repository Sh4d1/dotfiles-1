---

{% if grains['os'] == 'Arch' %}
terminal packages installed (Arch):
  pkg.installed:
    - pkgs:
      - git
      - gnupg
      - htop
      - octave
      - openssh
      - pinentry
      - python
      - python-jedi
      - python-neovim
      - python-netifaces
      - python-pip
      - python-virtualenv
      - python2
      - python2-jedi
      - python2-neovim
      - python2-pip
      - python2-requests
      - python2-virtualenv
      - ranger-git
      - ruby
      - the_silver_searcher
      - tmux
      - zsh
{% elif grains['os'] == 'Fedora' %}
terminal packages installed (Fedora):
  pkg.installed:
    - pkgs:
      - git
      - gnupg
      - htop
      - openssh
      - pinentry
      - python
      - python-devel
      - python-jedi
      - python-netifaces
      - python-pip
      - python2-requests
      - python-virtualenv
      - python3
      - python3-devel
      - python3-jedi
      - python3-pip
      - python3-requests
      - ranger
      - ruby
      - the_silver_searcher
      - tmux
      - zsh
{% endif %}

install tmuxinator:
  gem.installed:
    - name: tmuxinator
    - user: {{ grains['USER'] }}

make sure authorized_keys file exists:
  file.managed:
    - name: {{ grains['HOME'] }}/.ssh/authorized_keys
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - mode: 640
    - makedirs: true

make sure known_hosts file exists:
  file.managed:
    - name: {{ grains['HOME'] }}/.ssh/known_hosts
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - mode: 644
    - makedirs: true

copy ranger scope script:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/ranger/scope.sh
    - source: salt://files/.config/ranger/scope.sh
    - mode: 750
    - makedirs: true
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.bash_profile:
  file.managed:
    - name: {{ grains['HOME'] }}/.bash_profile
    - source: salt://files/.bash_profile
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.bashrc:
  file.managed:
    - name: {{ grains['HOME'] }}/.bashrc
    - source: salt://files/.bashrc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.config/ranger/commands.py:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/ranger/commands.py
    - source: salt://files/.config/ranger/commands.py
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/ranger/rc.conf:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/ranger/rc.conf
    - source: salt://files/.config/ranger/rc.conf
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/ranger/rifle.conf:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/ranger/rifle.conf
    - source: salt://files/.config/ranger/rifle.conf
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/htop/htoprc:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/htop/htoprc
    - source: salt://files/.config/htop/htoprc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.dircolors:
  file.managed:
    - name: {{ grains['HOME'] }}/.dircolors
    - source: salt://files/.dircolors
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.inputrc:
  file.managed:
    - name: {{ grains['HOME'] }}/.inputrc
    - source: salt://files/.inputrc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.octaverc:
  file.managed:
    - name: {{ grains['HOME'] }}/.octaverc
    - source: salt://files/.octaverc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.pathrc:
  file.managed:
    - name: {{ grains['HOME'] }}/.pathrc
    - source: salt://files/.pathrc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.tmux.conf:
  file.managed:
    - name: {{ grains['HOME'] }}/.tmux.conf
    - source: salt://files/.tmux.conf
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.zprofile:
  file.managed:
    - name: {{ grains['HOME'] }}/.zprofile
    - source: salt://files/.zprofile
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.zshrc:
  file.managed:
    - name: {{ grains['HOME'] }}/.zshrc
    - source: salt://files/.zshrc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.gitignore:
  file.managed:
    - name: {{ grains['HOME'] }}/.gitignore
    - source: salt://files/.gitignore
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.gitconfig:
  file.managed:
    - name: {{ grains['HOME'] }}/.gitconfig
    - source: salt://files/.gitconfig
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy bin files:
  file.recurse:
    - name: {{ grains['HOME'] }}/bin/
    - source: salt://files/bin/cli-global
    - file_mode: 750
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy zshenv (templated):
  file.managed:
    - name: {{ grains['HOME'] }}/.zshenv
    - source: salt://files/.zshenv
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - template: jinja

install/update zgen from git:
  git.latest:
    - name: https://github.com/tarjoilija/zgen.git
    - target: {{ grains['HOME'] }}/.zgen
    - branch: master
    - user: {{ grains['USER'] }}
