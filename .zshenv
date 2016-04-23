
typeset -U path
path=(~/bin $(ruby -e 'print Gem.user_dir')/bin $path[@])


