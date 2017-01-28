---

- name: email | install software
  pacman: name={{ item }} state=present
  when: ansible_distribution == "Archlinux"
  become: yes
  with_items:
    - msmtp
    - mutt
    - offlineimap-git

- name: email | set up directories
  file: path={{ ansible_env.HOME }}/{{ item }} state=directory mode="0750"
  with_items:
    - .mutt

- name: email | copy config files
  copy: src={{ item.src }} dest={{ ansible_env.HOME }}/{{ item.dest }} mode={{ item.mode | default("0640") }}
  with_items:
    - { src: '.msmtprc', dest: '.msmtprc' }
    - { src: '.mutt/mailcap', dest: '.mutt/mailcap' }
    - { src: '.mutt/muttrc', dest: '.mutt/muttrc' }
    - { src: '.mutt/muttrc.mailboxes', dest: '.mutt/muttrc.mailboxes' }
    - { src: '.mutt/sig', dest: '.mutt/sig' }
    - { src: '.mutt/solarized-dark16.theme', dest: '.mutt/solarized-dark16.theme' }
    - { src: '.offlineimap.py', dest: '.offlineimap.py' }
    - { src: '.offlineimaprc', dest: '.offlineimaprc' }
