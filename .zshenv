
typeset -U path
path=(~/bin ~/.local/bin ~/.node_modules/bin $(ruby -e 'print Gem.user_dir')/bin $path[@])


