

# dotfiles

These are my dotfiles, on git so I can quickly add sensible config to new machines/servers/etc, and roll back changes that broke something if necessary (although hopefully not necessary).

Shared here so you can browse through and get ideas. (And everyone needs a dotfiles repo hey?)


## installing

dotfiles are managed and installed with [ansible](https://www.ansible.com/).

- run `ansible-playbook dotfiles-install.yaml` to install

It will also make sure dependencies are installed.

## TODO

- Install ruby dependencies - ie with `gem install tmuxinator` (but use the gem module in ansible)

- split out a minimal set of dotfiles for small servers, etc.


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
- todoman
- todotxt-machine
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

