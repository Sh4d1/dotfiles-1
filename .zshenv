
typeset -U path
path=($(ruby -e 'print Gem.user_dir')/bin $path[@] ~/bin)


