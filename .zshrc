
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

# load zgen
source "${HOME}/dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

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

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'
ZSH_AUTOSUGGEST_STRATEGY='match_prev_cmd'

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000


setopt appendhistory nomatch
unsetopt autocd beep extendedglob notify
setopt hist_ignore_dups hist_ignore_all_dups hist_ignore_space
setopt menu_complete

bindkey -v

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=5
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '~/.zshrc'

autoload -U compinit
compinit



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

# so terminal not messed up after program crashed
ttyctl -f

run_vim() {
  {hash nvim 2>/dev/null && nvim "$@"} || {hash vim 2>/dev/null && vim "$@"} || {hash vi 2>/dev/null && vi "$@"}
}

alias ls='ls --color=auto'
alias rm='rm -I'
alias td='todotxt-machine'
alias c=z
alias v=run_vim
alias vim=run_vim
alias mux=tmuxinator
alias rg=ranger
alias gp='git push'
alias gs='git status'
alias gc='git commit'
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

