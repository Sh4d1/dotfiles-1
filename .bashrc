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



# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export HISTCONTROL=ignoreboth
shopt -s histappend

# ruby gem path, and bin directory in my home dir
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH:~/bin"
