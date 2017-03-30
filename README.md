
# Dotfiles

These are my dotfiles, including other setup tasks such as installing software, creating directories, etc.

Shared here so you can browse through and get ideas. And everyone needs a dotfiles repo hey?

Copyright © 2017 Samuel Walladge


## Installing

Dotfiles are managed and installed with [rcm](https://github.com/thoughtbot/rcm).

```bash
# install rcm for your platform - eg:
pacaur -y rcm

cd
git clone git@github.com:swalladge/dotfiles.git
RCRC=~/dotfiles/rcrc rcup

# note that future runs of rcup don't require the RCRC var
```

### Post install tasks

- run `:PlugInstall` in vim/nvim to install plugins


## Config included

- awesome wm (currently use/prefer i3)
- bash
- clipit
- clipster
- cmus
- copyq (new preferred clipboard manager)
- dunst
- gnupg
- htop
- i3
- i3pystatus
- i3status
- khal
- khard
- ls dircolors
- mpd (don't use - only basic config)
- msmtp
- mutt (neomutt)
- notmuch
- octave
- offlineimap
- qutebrowser (plus userscripts)
- ranger
- readline/login/init stuff
- rifle (part of ranger)
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

