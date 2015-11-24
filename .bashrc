#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export EDITOR="vim"
export TERMINAL="termite"
export BROWSER="qutebrowser"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
export JAVA_FONTS=/usr/share/fonts/TTF
export TERM=xterm-256color


if [ "$(uname -s)" == "Darwin" ]; then
    # Do something under OS X platform
    export PATH="/usr/local/bin:$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin"
    alias rm='rm -i'
    alias octave='PATH=/usr/local/octave/3.8.0/bin:/usr/local/octave/3.8.0/sbin:${PATH}  octave'
    # set up homebrew cask for global install
    export HOMEBREW_CASK_OPTS="--appdir=/Applications --prefpanedir=/Library/PreferencePanes --qlplugindir=/Library/QuickLook --widgetdir="/Library/Widgets" --fontdir=/Library/Fonts --input_methoddir=/Library/Input\ Methods --screen_saverdir=/Library/Screen\ Savers"
     

elif [ "$(uname -s)" == "Linux" ]; then
    # Do something under GNU/Linux platform

    alias ls='ls --color=auto'
    alias rm='rm -I'

    eval $(dircolors ~/.dircolors.ansi-dark)

    # ruby gem path, and bin directory in my home dir
    PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH:~/bin"

    # simple stopwatch function
    function stopwatch(){ local tempdate=`date +%s`; while true; do echo -ne "$(date -u --date @$((`date +%s` - $tempdate)) +'   %H:%M:%S')\r"; sleep 0.2; done }; 
fi



export HISTFILESIZE=5000
export HISTSIZE=5000
export HISTTIMEFORMAT="[%F %T] "
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTCONTROL=ignoreboth
shopt -s histappend


