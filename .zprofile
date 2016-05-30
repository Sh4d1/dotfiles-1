
# detect if logged in remotely
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export REMOTE_SESSION=true
fi


export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="termite"
export BROWSER="qutebrowser"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
export JAVA_FONTS=/usr/share/fonts/TTF
export MAIL=~/Maildir

# https://github.com/neovim/neovim/issues/2048#issuecomment-187227417
export TERMINFO="$HOME/.terminfo"

# export NODE_PATH="/usr/lib/node_modules/"
export NODE_PATH="~/.node_modules/lib/node_modules"

# export GPGKEY=5AC10404

# aur/makepkg stuff
export PKGDEST=~/aur/packages
export SRCDEST=~/aur/sources
export AURDEST=~/aur/pkgbuilds




