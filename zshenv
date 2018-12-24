
if ! [[ -o login ]]; then
  source "$HOME/.pathrc"
fi

# detect if logged in remotely
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export REMOTE_SESSION="true"
fi


if (( $+commands[nvim] )); then
  export EDITOR="nvim"
elif (( $+commands[vim] )); then
  export EDITOR="vim"
else
  export EDITOR="vi"
fi

export PAGER=less

export VISUAL=$EDITOR

export TERMINAL="urxvt"
export BROWSER="firefox"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp -Dsun.java2d.uiScale=2'
export JAVA_FONTS=/usr/share/fonts/TTF
export MAILDIR=~/Maildir/INBOX/
export MAIL=~/Maildir/INBOX/

export QT_QPA_PLATFORMTHEME="qt5ct"


# export NODE_PATH="/usr/lib/node_modules/"
# export NODE_PATH="$HOME/.node_modules/lib/node_modules"

# export GPGKEY=5AC10404

# steam options
# export STEAM_RUNTIME=0
export STEAM_FRAME_FORCE_CLOSE=1

export QT_AUTO_SCREEN_SCALE_FACTOR=1

# replacement for gnome-keyring-daemon
# requires keychain package installed
if (( $+commands[keychain] )); then
  eval $(keychain --noask --eval --agents ssh id_rsa 2>/dev/null)
fi


if (( $+commands[rustc] && $+commands[rustup] )); then
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

export GTK_IM_MODULE="xim"
export XMODIFIERS="@im=none"

export FZF_DEFAULT_COMMAND='rg --follow --files --hidden --color=never --glob ""'

export TERMCMD='urxvt'

export GRADLE_USER_HOME="$HOME/.gradle/"
export USER_HOME="$HOME"

# I prefer to not have production deploy logs littered with cows
export ANSIBLE_NOCOWS=1

# for ledger/hledger
export LEDGER_FILE="$HOME/ledger/main.ledger"


[[ -f ~/.zshenv_local ]] && . ~/.zshenv_local
