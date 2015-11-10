#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# simple stopwatch function
function stopwatch(){ local tempdate=`date +%s`; while true; do echo -ne "$(date -u --date @$((`date +%s` - $tempdate)) +'   %H:%M:%S')\r"; sleep 0.2; done }; 


export HISTFILESIZE=5000
export HISTSIZE=5000
export HISTTIMEFORMAT="[%F %T] "
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTCONTROL=ignoreboth
shopt -s histappend

if [ "$(uname -s)" == "Darwin" ]; then
    # Do something under OS X platform
    export PATH=$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin

elif [ "$(uname -s)" == "Linux" ]; then
    # Do something under GNU/Linux platform

    # ruby gem path, and bin directory in my home dir
    PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH:~/bin"

fi
