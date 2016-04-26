if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export REMOTE_SESSION=true
# else
#   case $(ps -o comm= -p $PPID) in
#     sshd|*/sshd|mosh-session) REMOTE_SESSION=true;;
#   esac
fi


export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="termite"
export BROWSER="qutebrowser"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
export JAVA_FONTS=/usr/share/fonts/TTF
export MAIL=~/Maildir
# export GPGKEY=5AC10404





