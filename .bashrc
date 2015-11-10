#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# simple stopwatch function
function stopwatch(){ local tempdate=`date +%s`; while true; do echo -ne "$(date -u --date @$((`date +%s` - $tempdate)) +'   %H:%M:%S')\r"; sleep 0.2; done }; 

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias rm='rm -I'

export EDITOR="vim"
export BROWSER="firefox"

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
export JAVA_FONTS=/usr/share/fonts/TTF


if [ "$(uname)" == "Darwin" ]; then
    # Do something under OS X platform
    alias octave='PATH=/usr/local/octave/3.8.0/bin:/usr/local/octave/3.8.0/sbin:${PATH}  octave'
    # set up homebrew cask for global install
    export HOMEBREW_CASK_OPTS="--appdir=/Applications --prefpanedir=/Library/PreferencePanes --qlplugindir=/Library/QuickLook --widgetdir="/Library/Widgets" --fontdir=/Library/Fonts --input_methoddir=/Library/Input\ Methods --screen_saverdir=/Library/Screen\ Savers"
     

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform

    # ruby gem path, and bin directory in my home dir
    PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH:~/bin"

fi

