---

- name: terminal (personal) | software
  pacman: name={{ item }} state=present
  when: ansible_distribution == "Archlinux"
  become: yes
  with_items:
    - todoman
    - cmus
    - mpd
    - ranger
    - vdirsyncer-git
    - khal-git
    - khard-git
    - todotxt-machine-git

- name: terminal (personal) | set up directories
  file: path={{ ansible_env.HOME }}/{{ item }} state=directory mode="0750"
  with_items:
    - .config/cmus
    - .config/khal
    - .config/khard
    - .config/mpd
    - .config/ranger
    - .config/todoman
    - .config/vdirsyncer
    - bin

- name: terminal (personal) | copy files
  copy: src={{ item.src }} dest={{ ansible_env.HOME }}/{{ item.dest }} mode={{ item.mode | default("0640") }}
  with_items:
    - { src: '.config/cmus/rc', dest: '.config/cmus/rc' }
    - { src: '.config/khal/config', dest: '.config/khal/config' }
    - { src: '.config/khard/khard.conf', dest: '.config/khard/khard.conf' }
    - { src: '.config/mpd/mpd.conf', dest: '.config/mpd/mpd.conf' }
    - { src: '.config/vdirsyncer/config', dest: '.config/vdirsyncer/config' }
    - { src: '.todotxt-machinerc', dest: '.todotxt-machinerc' }
    - { src: '.config/todoman/todoman.conf', dest: '.config/todoman/todoman.conf' }

- name: copy bin files
  copy: src={{ item }} dest={{ ansible_env.HOME }}/bin mode=0750
  with_fileglob:
    - bin/*
