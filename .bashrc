#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


export EDITOR="vim"
export BROWSER="firefox"

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
export JAVA_FONTS=/usr/share/fonts/TTF


if [ "$(uname -s)" == "Darwin" ]; then
    # Do something under OS X platform
    alias rm='rm -i'
    alias octave='PATH=/usr/local/octave/3.8.0/bin:/usr/local/octave/3.8.0/sbin:${PATH}  octave'
    # set up homebrew cask for global install
    export HOMEBREW_CASK_OPTS="--appdir=/Applications --prefpanedir=/Library/PreferencePanes --qlplugindir=/Library/QuickLook --widgetdir="/Library/Widgets" --fontdir=/Library/Fonts --input_methoddir=/Library/Input\ Methods --screen_saverdir=/Library/Screen\ Savers"
     

elif [ "$(uname -s)" == "Linux" ]; then
    # Do something under GNU/Linux platform

    alias ls='ls --color=auto'
    alias rm='rm -I'
    # ruby gem path, and bin directory in my home dir
    PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH:~/bin"

fi

