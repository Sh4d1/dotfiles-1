

# Dotfiles


## managed/installed using Dotbot

- run `./install -c <config file>` from in repo to populate symlinks for dotfiles (chose correct config file!)

### config files

- `install.macbook.conf.yaml` - installs all config along with some macbook specific files (from `macbook` dir), designed for my macbook
- `install.conf.yaml` - main config which installs everything, designed for my desktop
- `install.server.conf.yaml` - only installs stuff for console apps, designed for my servers


## notes



## dependencies

- ruby
- vim
- python (preferably version 3)


## post install tasks

- run `:PlugInstall` in vim to install plugins
