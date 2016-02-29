
if [ -n "$REMOTE_SESSION" ]; then
  # BULLETTRAIN_CONTEXT_SHOW=true
  # BULLETTRAIN_IS_SSH_CLIENT=true
  BULLETTRAIN_CUSTOM_MSG="\u26a1 $(hostname)" 
fi

# BULLETTRAIN_PROMPT_SEPARATE_LINE=true
# BULLETTRAIN_PROMPT_CHAR='\$'
BULLETTRAIN_TIME_SHOW=false
BULLETTRAIN_DIR_EXTENDED=0
BULLETTRAIN_VIRTUALENV_PREFIX=""
BULLETTRAIN_STATUS_EXIT_SHOW=true

export PKGDEST=~/aur/packages
export SRCDEST=~/aur/sources
export AURDEST=~/aur/pkgbuilds

# load zgen
source "${HOME}/dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
    zgen load rupa/z


    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi


HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000


setopt appendhistory nomatch
unsetopt autocd beep extendedglob notify
setopt HIST_IGNORE_DUPS

bindkey -v

zstyle :compinstall filename '/home/samuel/.zshrc'

autoload -U compinit promptinit
compinit
promptinit



# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward


# so backspace still works
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# delete actually deletes
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# so terminal not messed up after program crashed
ttyctl -f


alias ls='ls --color=auto'
alias rm='rm -I'
alias td='todotxt-machine'
alias  c=z

# shortcuts to force password auth (avoid too many auth attempts error)
alias moshp='mosh --ssh="ssh -o PubkeyAuthentication=no"'
alias sshp='ssh -o PubkeyAuthentication=no'

[[ -f ~/.zshrc_local ]] && . ~/.zshrc_local

# lets start the shell cleanly
true

