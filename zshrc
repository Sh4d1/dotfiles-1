
# If not running interactively, do nothing
[[ $- != *i* ]] && return

# Below are some various methods for automatically running tmux on opening a
# shell. They work well, but I like access to the shell sometimes without tmux
# around it...
# [[ -z "$TMUX" ]] && [[ -z "$REMOTE_SESSION" ]] && hash tmux 2>/dev/null && exec tmux new-session -A -s terminal
# [[ -z "$TMUX" ]] && hash tmux 2>/dev/null && exec tmux
# [[ -z "$TMUX" ]] && hash tmux 2>/dev/null && {tmux list-sessions && exec tmux attach || exec tmux}


# OPTIONS

setopt appendhistory nomatch
unsetopt autocd beep extendedglob notify
setopt hist_ignore_dups hist_ignore_all_dups hist_ignore_space
setopt interactivecomments

# <https://unix.stackexchange.com/questions/295508/zsh-completion-menu-and-unambiguous-prefix-with-a-single-tab>
setopt nolistambiguous

# so terminal not messed up after program crashed
ttyctl -f

# ls colors
[[ -f ~/.dircolors ]] && eval `dircolors ~/.dircolors`

# config for zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# must be loaded before zsh-syntax-highlighting <https://github.com/zsh-users/zsh-syntax-highlighting/issues/67>
autoload -Uz select-word-style
select-word-style bash


# PLUGINS WITH ZPLUG

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

# https://github.com/zplug/zplug/
source ~/.zplug/init.zsh

# plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"

# completions
zplug "zsh-users/zsh-completions"

# pure prompt
zplug "mafredri/zsh-async", from:github
zplug "swalladge/pure", use:pure.zsh, from:github, as:theme
# zplug "~/projects/pure/", from:local, as:theme, use:pure.zsh

# zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install packages that have not been installed yet
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

# load the plugins!
zplug load


# autojump plugin (installed via pacman)
source /etc/profile.d/autojump.zsh 2>/dev/null



# VARIABLES

ZSH_HIGHLIGHT_STYLES[comment]='fg=cyan'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_AUTOSUGGEST_STRATEGY='default'
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=( forward-word )
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# COMPLETIONS

ZLE_REMOVE_SUFFIX_CHARS='* \t\n;&|'
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
# zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename '~/.zshrc'

# http://nion.modprobe.de/blog/archives/521-hostname-completion-with-zsh.html
local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*' hosts $knownhosts

autoload -Uz compinit edit-command-line
zle -N edit-command-line
compinit

# gopass completions
command -v gopass >/dev/null && source <(gopass completion zsh)

# exercism completion
[ -f ~/.config/exercism/exercism_completion.zsh ] && . ~/.config/exercism/exercism_completion.zsh


# KEY BINDINGS


# ok let's try normal readline mode - that way i can be comfortable even in
# shells where i haven't set that up...
bindkey -e

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
bindkey -M viins '^P' history-substring-search-up
bindkey -M viins '^N' history-substring-search-down

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

# edit command line in editor
bindkey -M vicmd v edit-command-line
bindkey -M viins '^E' edit-command-line

# for emacs mode
bindkey -M emacs "^X^E" edit-command-line

# insert mode bindings - forward-word also partially accepts autosuggest
bindkey -M viins '^F' forward-word
bindkey -M viins '^B' backward-word

# ALIASES

alias ls='ls --color=auto'
alias rm='rm -I'
alias td='todotxt-machine'
alias c=j
alias e=$EDITOR
alias ni=nvim
alias mux=tmuxinator
alias rgr=ranger
alias t=tmux
alias ta='tmux attach'
alias hc=herbstclient
alias ml='tmuxinator local'

# inspiration for git aliases from https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
# don't need that many though
alias g='git'
alias gg='git grep'
alias ga='git add'
alias gaa='git add --all'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gb='git branch'
alias gps='git push'
alias gpl='git pull'
alias gss='git status -sb'
alias gcm='git commit -v'
alias gco='git checkout'
alias gf='git fetch'
alias grv='git remote -v'
alias gmm='git merge'
alias grb='git rebase'
alias glog='git lg'

alias upgrade='sudo pacman -Syu && pacaur -u --devel'
alias vimdiff='nvim -d'
alias status='systemctl status'
alias ustatus='systemctl status --user'
alias sys='systemctl'

# shortcuts to force password auth (avoid too many auth attempts error)
alias moshp='mosh --ssh="ssh -o PubkeyAuthentication=no"'
alias sshp='ssh -o PubkeyAuthentication=no'
alias rsyncp="rsync -e 'ssh -o PubkeyAuthentication=no'"

alias swipl-test='swipl -g true -t halt. -s'

alias :q='exit'

# shortcut to run the android emulator manager installed with android studio
emulator() {
  (
    cd ~/Android/Sdk/tools/
    ./emulator "$@"
  )
}

export GPG_TTY=$(tty)

# anything local to this machine
[[ -f ~/.zshrc_local ]] && . ~/.zshrc_local


# my original custom prompt styled after my vim/tmux status bar - uncomment and
# remove pure prompt from zplug plugins to enable
#
# setopt promptsubst
# precmd() {
#   LASTSTATUS=$?
#   PROMPT=""
#   RPROMPT=""

#   # last status
#   if [ $LASTSTATUS -ne 0 ]; then
#     RPROMPT+="%F{7}%K{9} $LASTSTATUS %k%f"
#   fi

#   # git status
#   BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
#   if [ $? = 0 ]; then
#     RPROMPT+="%K{6}%F{0} $BRANCH "
#     # can be unbelievable slow on large repos?
#     DIRTY=$(git status --porcelain 2>/dev/null | wc -l)
#     if [ $DIRTY -ne 0 ]; then
#       RPROMPT+="[$DIRTY] "
#     fi
#     RPROMPT+="%f%k"
#   fi

#   # virtual environment
#   VENV=$(echo $VIRTUAL_ENV | awk -F '/' '{print $NF}')
#   if [ -n "$VENV" ]; then
#     RPROMPT+="%K{3}%F{0} ($VENV) %f%k"
#   fi

#   # any background jobs
#   JOBS=$(jobs | wc -l)
#   if [ $JOBS -ne 0 ]; then
#     PROMPT+="%K{2}%F{8} $JOBS %f%k"
#   fi

#   # username/host
#   PROMPT+="%K{7}%F{8} %n"
#   if [ "$REMOTE_SESSION" = "true" ]; then
#     PROMPT+="@%m"
#   fi
#   PROMPT+=" %f%k"

#   # location
#   PROMPT+="%K{10}%F{0} %20<…<%2~%<< %f%k"

#   # final space
#   PROMPT+=" "
# }


# cd to the root of current project if currently in a project
cdr() {
  # add other root marker files/dirs here
  local MARKERS=('.git' '.hg')

  local TARGET="`pwd`"
  local DONE="false"

  while true; do
    for MARKER in $MARKERS; do
      if [ -e $MARKER ]; then
        DONE="true"
        TARGET="`pwd`"
        break
      fi
    done
    [[ "$DONE" = "true" || "`pwd`" = "/" ]] && break
    cd ..
  done

  cd "$TARGET"
}


# function zle-keymap-select zle-line-init zle-line-finish {
#   case $KEYMAP in
#     vicmd)      print -n -- "\e[1 q";; # block cursor
#     viins|main) print -n -- "\e[5 q";; # line cursor
#   esac

#   zle reset-prompt
#   zle -R
# }

# zle -N zle-line-init
# zle -N zle-line-finish
# zle -N zle-keymap-select

# no delay on pressing escape
KEYTIMEOUT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
