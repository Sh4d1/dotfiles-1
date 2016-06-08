

# OPTIONS

setopt appendhistory nomatch
unsetopt autocd beep extendedglob notify
setopt hist_ignore_dups hist_ignore_all_dups hist_ignore_space
setopt menu_complete

# so terminal not messed up after program crashed
ttyctl -f

# ls colors
[[ -f ~/.dircolors ]] && eval `dircolors ~/.dircolors`


# PLUGINS WITH ZGEN
# load zgen
source ~/dotfiles/zgen/zgen.zsh

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # plugins
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-autosuggestions
    # zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
    zgen load rupa/z

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi


# VARIABLES

# when using bullet train prompt
# if [ -n "$REMOTE_SESSION" ]; then
#   # BULLETTRAIN_CONTEXT_SHOW=true
#   # BULLETTRAIN_IS_SSH_CLIENT=true
#   BULLETTRAIN_CUSTOM_MSG="\u26a1 $(hostname)"
# fi
#
# BULLETTRAIN_PROMPT_SEPARATE_LINE=true
# BULLETTRAIN_PROMPT_CHAR='\$'
# BULLETTRAIN_TIME_SHOW=false
# BULLETTRAIN_DIR_EXTENDED=0
# BULLETTRAIN_VIRTUALENV_PREFIX=""
# BULLETTRAIN_STATUS_EXIT_SHOW=true

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_AUTOSUGGEST_STRATEGY='match_prev_cmd'

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# COMPLETIONS

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# KEY BINDINGS

bindkey -v

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

bindkey '^ ' autosuggest-accept
bindkey '^[^M' autosuggest-execute


# ALIASES

alias ls='ls --color=auto'
alias rm='rm -I'
alias td='todotxt-machine'
alias c=z
alias e=$EDITOR
alias mux=tmuxinator
alias rg=ranger
alias gp='git push'
alias gs='git status'
alias gcom='git commit'
alias gc='git checkout'
alias gf='git fetch'
alias gm='git fetch'
alias gd='git diff'
alias ga='git add'

# shortcuts to force password auth (avoid too many auth attempts error)
alias moshp='mosh --ssh="ssh -o PubkeyAuthentication=no"'
alias sshp='ssh -o PubkeyAuthentication=no'


# anything local to this machine
[[ -f ~/.zshrc_local ]] && . ~/.zshrc_local

# prompt built with promptline.vim
[[ -f ~/.promptline.sh ]] && . ~/.promptline.sh

# lets start the shell cleanly
true

