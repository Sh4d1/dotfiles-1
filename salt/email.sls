---

{% if grains['os'] == 'Arch' %}
email client packages installed (Arch):
  pkg.installed:
    - pkgs:
      - msmtp
      - neomutt
      - offlineimap-git
      - notmuch
{% endif %}

copy mutt config:
  file.recurse:
    - name: {{ grains['HOME'] }}/.mutt/
    - source: salt://files/.mutt/
    - file_mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

cache dir for mutt:
  file.directory:
    - name: {{ grains['HOME'] }}/.mutt/cache/
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy notmuch config:
  file.managed:
    - name: {{ grains['HOME'] }}/.notmuch-config
    - source: salt://files/.notmuch-config
    - file_mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}

copy ~/.msmtprc:
  file.managed:
    - name: {{ grains['HOME'] }}/.msmtprc
    - source: salt://files/.msmtprc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.offlineimap.py:
  file.managed:
    - name: {{ grains['HOME'] }}/.offlineimap.py
    - source: salt://files/.offlineimap.py
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

copy ~/.offlineimaprc:
  file.managed:
    - name: {{ grains['HOME'] }}/.offlineimaprc
    - source: salt://files/.offlineimaprc
    - mode: 640
    - user: {{ grains['USER'] }}
    - group: {{ grains['GROUP'] }}
    - makedirs: true

