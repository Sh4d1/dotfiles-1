

# Dotfiles

These are my dotfiles, on git so I can quickly add sensible config to new machines/servers/etc, and roll back changes that broke something if necessary (although hopefully not necessary).

Shared here so you can browse through and get ideas. (And everyone needs a dotfiles repo hey?)


## installing

dotfiles are managed and installed with [dotbot](https://github.com/anishathalye/dotbot)

- run `./install -c <config file>` from in repo to populate symlinks for dotfiles (chose correct config file!)


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
- dunst
- htop
- i3
- i3pystatus
- i3status
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
- vim/neovim
- X11 (xinitrc, Xresources)
- zsh

