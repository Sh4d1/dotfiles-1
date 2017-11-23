
export ANDROID_HOME="/home/samuel/Android/Sdk"

if ! [[ -o login ]]; then
  source "$HOME/.pathrc"
fi

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

export PAGER=less

export VISUAL=$EDITOR

export TERMINAL="termite"
export BROWSER="firefox"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
export JAVA_FONTS=/usr/share/fonts/TTF
export MAILDIR=~/Maildir/INBOX/
export MAIL=~/Maildir/INBOX/

export QT_QPA_PLATFORMTHEME="qt5ct"


# https://github.com/neovim/neovim/issues/2048#issuecomment-187227417
export TERMINFO="$HOME/.terminfo"

# export NODE_PATH="/usr/lib/node_modules/"
# export NODE_PATH="$HOME/.node_modules/lib/node_modules"

# export GPGKEY=5AC10404

# steam options
# export STEAM_RUNTIME=0
export STEAM_FRAME_FORCE_CLOSE=1

export QT_AUTO_SCREEN_SCALE_FACTOR=1

if hash gnome-keyring-daemon 2>/dev/null; then
  eval $(gnome-keyring-daemon --start 2>/dev/null)
  export SSH_AUTH_SOCK
fi

export FZF_DEFAULT_COMMAND='rg --files --color=never --glob ""'

# eval `keychain --noask --eval --agents ssh id_rsa`

if hash rustc 2>/dev/null && hash rustup 2>/dev/null; then
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

export GTK_IM_MODULE="xim"
export XMODIFIERS="@im=none"

export FZF_DEFAULT_COMMAND='rg --files --hidden --color=never --glob ""'

export TERMCMD='termite'

[[ -f ~/.zshenv_local ]] && . ~/.zshenv_local

