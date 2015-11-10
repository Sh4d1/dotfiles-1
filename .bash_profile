#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


export HISTFILESIZE=5000
export HISTSIZE=5000
export HISTTIMEFORMAT="[%F %T] "
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTCONTROL=ignoreboth
shopt -s histappend

if [ "$(uname)" == "Darwin" ]; then
    # Do something under OS X platform
    export PATH=$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform

    # ruby gem path, and bin directory in my home dir
    PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH:~/bin"

fi
