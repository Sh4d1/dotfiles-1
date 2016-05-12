
typeset -U path
path=(~/bin ~/.local/bin $(ruby -e 'print Gem.user_dir')/bin $path[@])


