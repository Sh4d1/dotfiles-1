---

- name: desktop | software
  pacman: name={{ item }} state=present
  when: ansible_distribution == "Archlinux"
  become: yes
  with_items:
    - awesome
    - blueberry
    - clipit
    - clipster-git
    - compton
    - conky
    - copyq
    - dmenu
    - dunst
    - feh
    - i3-wm
    - i3status
    - i3lock
    - kdeconnect
    - maim
    - network-manager-applet
    - nextcloud-client
    - nodejs
    - numlockx
    - pasystray-git
    - pulseaudio-ctl
    - python-requests
    - python2-gnomekeyring
    - qutebrowser-git
    - rofi
    - scrot
    - slop
    - termite
    - udiskie
    - xbanish-git
    - xcape-git
    - xdotool
    - xfce4-appfinder
    - xf86-input-mtrack-git
    - xorg-xset
    - xorg-xsetroot
    - xorg-xmodmap
    - xorg-setxkbmap
    - xorg-xbacklight

- name: desktop | pip software (python3)
  pip: name={{ item }} state=latest executable=pip3
  become: yes
  with_items:
    - i3pystatus
    - colour # for i3pystatus
    - readability-lxml # for readerview.py

- name: desktop | set up directories
  file: path={{ ansible_env.HOME }}/{{ item }} state=directory mode="0750"
  with_items:
    - .config/awesome
    - .config/clipit
    - .config/clipster
    - .config/copyq
    - .config/dunst
    - .config/i3
    - .config/i3status
    - .config/qutebrowser
    - .config/termite
    - .config/udiskie
    - .local/share/qutebrowser/userscripts
    - bin

- name: desktop | copy files
  copy: src={{ item.src }} dest={{ ansible_env.HOME }}/{{ item.dest }} mode={{ item.mode | default("0640") }}
  with_items:
    - { src: '.config/awesome/rc.lua', dest: '.config/awesome/rc.lua' }
    - { src: '.config/clipit/clipitrc', dest: '.config/clipit/clipitrc' }
    - { src: '.config/clipster/clipster.ini', dest: '.config/clipster/clipster.ini' }
    - { src: '.config/copyq/copyq.conf', dest: '.config/copyq/copyq.conf' }
    - { src: '.config/i3status/config', dest: '.config/i3status/config' }
    - { src: '.config/i3status/config-secondary', dest: '.config/i3status/config-secondary' }
    - { src: '.config/qutebrowser/keys.conf', dest: '.config/qutebrowser/keys.conf' }
    - { src: '.config/termite/config', dest: '.config/termite/config' }
    - { src: '.config/termite/small-font-config', dest: '.config/termite/small-font-config' }
    - { src: '.config/udiskie/config.yml', dest: '.config/udiskie/config.yml' }
    - { src: 'qutebrowser-userscripts/pinboard_add.sh', dest: '.local/share/qutebrowser/userscripts/pinboard_add.sh', mode: "0750" }
    - { src: 'qutebrowser-userscripts/readerview.py', dest: '.local/share/qutebrowser/userscripts/readerview.py', mode: "0750" }
    - { src: 'qutebrowser-userscripts/vimgolf.sh', dest: '.local/share/qutebrowser/userscripts/vimgolf.sh', mode: "0750" }
    - { src: 'qutebrowser-userscripts/wallabag_add.sh', dest: '.local/share/qutebrowser/userscripts/wallabag_add.sh', mode: "0750" }
    - { src: 'qutebrowser-userscripts/wordreference_fr.sh', dest: '.local/share/qutebrowser/userscripts/wordreference_fr.sh', mode: "0750" }
    - { src: '.config/dunst/dunstrc', dest: '.config/dunst/dunstrc' }
    - { src: '.config/qutebrowser/qutebrowser.conf', dest: '.config/qutebrowser/qutebrowser.conf' }

- name: desktop | copy bin files
  copy: src={{ item }} dest={{ ansible_env.HOME }}/bin mode=0750
  with_fileglob:
    - bin/*

- name: desktop | copy files with templates
  template: src={{ item.src }} dest={{ ansible_env.HOME }}/{{ item.dest }} mode={{ item.mode | default("0640") }}
  with_items:
    - { src: '.Xresources', dest: '.Xresources' }
    - { src: '.config/i3/config', dest: '.config/i3/config' }
