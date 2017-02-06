
{% if grains['os'] == 'Arch' %}
personal terminal packages installed (Arch):
  pkg.installed:
    - pkgs:
      - todoman
      - cmus
      - mpd
      - vdirsyncer-git
      - khal-git
      - khard-git
      - todotxt-machine-git
{% endif %}

copy ~/.config/cmus/rc:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/cmus/rc
    - source: salt://files/.config/cmus/rc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/khal/config:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/khal/config
    - source: salt://files/.config/khal/config
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/khard/khard.conf:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/khard/khard.conf
    - source: salt://files/.config/khard/khard.conf
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/mpd/mpd.conf:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/mpd/mpd.conf
    - source: salt://files/.config/mpd/mpd.conf
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/vdirsyncer/config:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/vdirsyncer/config
    - source: salt://files/.config/vdirsyncer/config
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.config/todoman/todoman.conf:
  file.managed:
    - name: {{ grains['HOME'] }}/.config/todoman/todoman.conf
    - source: salt://files/.config/todoman/todoman.conf
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.todotxt-machinerc:
  file.managed:
    - name: {{ grains['HOME'] }}/.todotxt-machinerc
    - source: salt://files/.todotxt-machinerc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy cli personal scripts:
  file.recurse:
    - name: {{ grains['HOME'] }}/bin/
    - source: salt://files/bin/cli-personal
    - file_mode: 750
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
