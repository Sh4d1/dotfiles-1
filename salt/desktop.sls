
{% if grains['os'] == 'Arch' %}
personal desktop packages installed (Arch):
  pkg.installed:
    - pkgs:
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
{% endif %}

install i3pystatus from pip (python3):
  pip.installed:
    - name: i3pystatus
    - bin_env: /usr/bin/pip3

install colour from pip - for i3pystatus (python3):
  pip.installed:
    - name: colour
    - bin_env: /usr/bin/pip3

install readability-lxml from pip - for qutebrowser readerview script (python3):
  pip.installed:
    - name: readability-lxml
    - bin_env: /usr/bin/pip3

copy ~/.config/awesome/rc.lua:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/awesome/rc.lua
    - source: salt://files/.config/awesome/rc.lua
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/clipit/clipitrc:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/clipit/clipitrc
    - source: salt://files/.config/clipit/clipitrc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/clipster/clipster.ini:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/clipster/clipster.ini
    - source: salt://files/.config/clipster/clipster.ini
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/copyq/copyq.conf:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/copyq/copyq.conf
    - source: salt://files/.config/copyq/copyq.conf
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/i3status/config:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/i3status/config
    - source: salt://files/.config/i3status/config
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/i3status/:
  file.recurse:
    - name: {{ grains['HOME'] }}/.config/i3status/
    - source: salt://files/.config/i3status/
    - file_mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/qutebrowser/:
  file.recurse:
    - name: {{ grains['HOME'] }}/.config/qutebrowser/
    - source: salt://files/.config/qutebrowser/
    - file_mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/termite/:
  file.recurse:
    - name: {{ grains['HOME'] }}/.config/termite
    - source: salt://files/.config/termite
    - file_mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/dunst/dunstrc:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/dunst/dunstrc
    - source: salt://files/.config/dunst/dunstrc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/udiskie/config.yml:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/udiskie/config.yml
    - source: salt://files/.config/udiskie/config.yml
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/i3/config (templated):
  file.managed:
    - name: {{ grains['HOME'] }}/.config/i3/config
    - source: salt://files/.config/i3/config
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true
    - template: jinja

copy ~/.Xresources (templated):
  file.managed:
    - name: {{ grains['HOME'] }}/.Xresources
    - source: salt://files/.Xresources
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true
    - template: jinja

copy qutebrowser userscripts:
  file.recurse:
    - name: {{ grains['HOME'] }}/.local/share/qutebrowser/userscripts/
    - source: salt://files/qutebrowser-userscripts/
    - file_mode: 750
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy desktop bin files:
  file.recurse:
    - name: {{ grains['HOME'] }}/bin/
    - source: salt://files/bin/gui-personal
    - file_mode: 750
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

