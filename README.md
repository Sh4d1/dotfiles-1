

# dotfiles

These are my dotfiles, on git so I can quickly add sensible config to new machines/servers/etc, and roll back changes that broke something if necessary (although hopefully not necessary).

Shared here so you can browse through and get ideas. (And everyone needs a dotfiles repo hey?)


## installing

dotfiles are managed and installed with ~[dotbot](https://github.com/anishathalye/dotbot)~
[ansible](https://www.ansible.com/).

- ~run `./install -c <config file>` from in repo to populate symlinks for dotfiles (chose correct config file!)~

- run `ansible-playbook dotfiles-install.yaml` to install ... to be reworked


### dependencies

- ruby
- vim (or gvim) (actually neovim is recommended)
- python (version 3)
- python-pip

Plus all the other apps...

- install most through package manager (`pacman -S ...`)
- `gem install tmuxinator`
- `pip install --user i3pystatus`

### install config files

- `install.macbook.conf.yaml` - installs all config along with some macbook specific files (from `macbook` dir), designed for my macbook
- `install.conf.yaml` - main config which installs everything, designed for my desktop
- `install.server.conf.yaml` - only installs stuff for console apps on my servers


### post install tasks

- run `:PlugInstall` in vim/nvim to install plugins


## app config included

- awesome wm (currently use/prefer i3)
- bash
- clipit
- clipster
- cmus
- copyq (new preferred clipboard manager)
- dunst
- htop
- i3
- i3pystatus
- i3status
- khal
- khard
- ls dircolors
- mpd (don't use - only basic config)
- msmtp
- mutt
- octave
- offlineimap
- qutebrowser (plus userscripts)
- ranger
- readline/login/init stuff
- rofi
- termite
- tmux
- todotxt-machine
- touchegg
- udiskie
- vdirsyncer
- vim/neovim
- X11 (xinitrc, Xresources)
- zsh

## LICENSE

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

This repository contains both original and third party content.
Content can be assumed to be original unless stated otherwise.
Original content is copyright © 2016 Samuel Walladge, and can be used and distributed under the terms of
the GPLv3. All third party content is copyright their respective authors and bound by their original licenses.

All attempts have been made to identify third party content within the repository, with sources and attribution given
where necessary. Please contact me if any issues are discovered.

