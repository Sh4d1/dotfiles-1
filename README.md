

# Dotfiles

These are my dotfiles, on git so I can quickly add sensible config to new machines/servers/etc, and roll back changes that broke something if necessary (although hopefully not necessary).

Shared here so you can browse through and get ideas. (And everyone needs a dotfiles repo hey?)


## installing

dotfiles are managed and installed with [dotbot](https://github.com/anishathalye/dotbot)

- run `./install -c <config file>` from in repo to populate symlinks for dotfiles (chose correct config file!)


### dependencies

- ruby
- vim (or gvim on archlinux for system clipboard support)
- python (preferably version 3)


### install config files

- `install.macbook.conf.yaml` - installs all config along with some macbook specific files (from `macbook` dir), designed for my macbook
- `install.conf.yaml` - main config which installs everything, designed for my desktop
- `install.server.conf.yaml` - only installs stuff for console apps, designed for my servers


### post install tasks

- run `:PlugInstall` in vim to install plugins


## app config included

- vim
- bash
- octave
- X11 (xinitrc, Xresources)
- todotxt-machine
- tmux
- ls dircolors
- i3 and i3 status bar
- awesome wm (although currently use/prefer i3)
- htop
- mpd (don't use - only boring basic config)
- clipit
- touchegg
- qutebrowser
- termite
- dunst
- and readline/login/init stuff
- zsh
- ranger
- udiskie

