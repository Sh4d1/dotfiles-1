---

- name: terminal (global) | check installed packages (arch)
  pacman: name={{ item }} state=present
  become: yes
  with_items:
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
    - ranger
    - ruby
    - the_silver_searcher
    - tmux
    - zsh
  when: ansible_distribution == "Archlinux"

- name: terminal (global) | check installed packages (fedora)
  dnf: name={{ item }} state=present
  become: yes
  with_items:
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
  when: ansible_distribution == "Fedora"


- name: terminal (global) | set up directories
  file: path={{ ansible_env.HOME }}/{{ item }} state=directory mode="0750"
  with_items:
    - .config/ranger
    - bin
    - .ssh

- name: terminal (global) | create authorized_keys file if not existing (create)
  file: path={{ ansible_env.HOME }}/.ssh/authorized_keys state=touch mode="0640"

- name: terminal (global) | create known_hosts file if not existing
  file: path={{ ansible_env.HOME }}/.ssh/known_hosts state=touch mode="0644"

- name: terminal (global) | copy files
  copy: src={{ item.src }} dest={{ ansible_env.HOME }}/{{ item.dest }} mode={{ item.mode | default("0640") }}
  with_items:
    - { src: '.bash_profile', dest: '.bash_profile' }
    - { src: '.bashrc', dest: '.bashrc' }
    - { src: '.config/ranger/commands.py', dest: '.config/ranger/commands.py' }
    - { src: '.config/ranger/rc.conf', dest: '.config/ranger/rc.conf' }
    - { src: '.config/ranger/rifle.conf', dest: '.config/ranger/rifle.conf' }
    - { src: '.config/ranger/scope.sh', dest: '.config/ranger/scope.sh', mode: "0750" }
    - { src: '.dircolors', dest: '.dircolors' }
    - { src: '.inputrc', dest: '.inputrc' }
    - { src: '.octaverc', dest: '.octaverc' }
    - { src: '.pathrc', dest: '.pathrc' }
    - { src: '.tmux.conf', dest: '.tmux.conf' }
    - { src: '.zprofile', dest: '.zprofile' }
    - { src: '.zshrc', dest: '.zshrc' }
    - { src: '.gitignore', dest: '.gitignore' }
    - { src: '.gitconfig', dest: '.gitconfig' }

- name: terminal (global) | copy bin files
  copy: src={{ item }} dest={{ ansible_env.HOME }}/bin mode=0750
  with_fileglob:
    - bin/*

- name: copy files with templates
  template: src={{ item.src }} dest={{ ansible_env.HOME }}/{{ item.dest }} mode={{ item.mode | default("0640") }}
  with_items:
    - { src: '.zshenv', dest: '.zshenv' }

- name: terminal (global) | install/update zgen
  git: repo='https://github.com/tarjoilija/zgen.git' dest={{ ansible_env.HOME }}/.zgen
