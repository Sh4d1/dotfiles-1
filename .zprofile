
# detect if logged in remotely
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export REMOTE_SESSION="true"
fi


if hash nvim 2>/dev/null; then
  export EDITOR="nvim"
elif hash vim 2>/dev/null; then
  export EDITOR="vim"
else
  export EDITOR="vi"
fi

export VISUAL=$EDITOR

export TERMINAL="termite"
export BROWSER="qutebrowser"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
export JAVA_FONTS=/usr/share/fonts/TTF
export MAIL=~/Maildir

export QT_QPA_PLATFORMTHEME="qt5ct"

# https://github.com/neovim/neovim/issues/2048#issuecomment-187227417
export TERMINFO="$HOME/.terminfo"

# export NODE_PATH="/usr/lib/node_modules/"
# export NODE_PATH="$HOME/.node_modules/lib/node_modules"

# export GPGKEY=5AC10404

# aur/makepkg stuff
export PKGDEST=~/aur/packages
export SRCDEST=~/aur/sources
export AURDEST=~/aur/pkgbuilds

# steam options
# export STEAM_RUNTIME=0
export STEAM_FRAME_FORCE_CLOSE=1
