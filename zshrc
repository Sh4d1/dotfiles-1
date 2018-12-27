# zmodload zsh/zprof


# If not running interactively, do nothing
[[ $- != *i* ]] && return

# export TERM=tmux-256color

# disable catching <c-q> and <c-s>
stty stop undef
stty start undef

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
setopt correct

# <https://unix.stackexchange.com/questions/295508/zsh-completion-menu-and-unambiguous-prefix-with-a-single-tab>
setopt nolistambiguous

# so terminal not messed up after program crashed
ttyctl -f

# ls colors
[[ -f ~/.dircolors ]] && eval `dircolors ~/.dircolors`

# config for zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# must be loaded before zsh-syntax-highlighting <https://github.com/zsh-users/zsh-syntax-highlighting/issues/67>
autoload -Uz select-word-style
select-word-style bash


# PLUGINS WITH ZPLUG

# export ZPLUG_LOG_LOAD_

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

zplug "mafredri/zsh-async", from:github

# My fork has some improvements:
# - green prompt symbol instead of magenta (contrasts better with red)
# - shows count for backgrounded processes
zplug "swalladge/pure", use:pure.zsh, from:github, as:theme
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

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

X_ZSH_HIGHLIGHT_DIRS_BLACKLIST+=("$HOME/mnt")
X_ZSH_HIGHLIGHT_DIRS_BLACKLIST+=("$HOME/Network")
X_ZSH_HIGHLIGHT_DIRS_BLACKLIST+=("$HOME/Shared")


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_AUTOSUGGEST_STRATEGY='history'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=80
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=( forward-word )
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
# need to set this to 12 (or unset) to display the venv info in prompt
VIRTUAL_ENV_DISABLE_PROMPT=12

# COMPLETIONS

# ZLE_REMOVE_SUFFIX_CHARS='* \t\n;&|'
ZLE_REMOVE_SUFFIX_CHARS=''
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



# gopass completions (now integrated in archlinux)
# command -v gopass >/dev/null && source <(gopass completion zsh)

# exercism completion
[ -f ~/.config/exercism/exercism_completion.zsh ] && . ~/.config/exercism/exercism_completion.zsh


# KEY BINDINGS


# ok let's try normal readline mode - that way i can be comfortable even in
# shells where i haven't set that up...
bindkey -e

# # bind UP and DOWN arrow keys
# zmodload zsh/terminfo
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down

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

alias ls='ls --color=auto -hls'
alias lsa='ls --color=auto -hlsa'
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
alias g='git'
alias tk='task'
alias m='neomutt'
alias p='gopass'

alias vimdiff='nvim -d'
alias status='systemctl status'
alias ustatus='systemctl status --user'
alias sys='systemctl'

# shortcuts to force password auth (avoid too many auth attempts error)
alias moshp='mosh --ssh="ssh -o PubkeyAuthentication=no"'
alias sshp='ssh -o PubkeyAuthentication=no'
alias rsyncp="rsync -e 'ssh -o PubkeyAuthentication=no'"

alias swipl-test='swipl -g true -t halt. -s'

alias x=startx

alias wi='nvim +VimwikiIndex'
alias diary='nvim +VimwikiDiaryIndex'

alias hl='hledger'

alias :q='exit'

# shortcut to run the android emulator manager installed with android studio
emulator() {
  (
    cd ~/Android/Sdk/tools/
    ./emulator "$@"
  )
}

export GPG_TTY=$(tty)


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

# show a grid of 256 colours - useful for quick reference
colours() {
  for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i
    if ! (( ($i + 1 ) % 8 )); then
      echo
    fi
  done
}

peek() {
  if [ -n "$TMUX" ]; then
    tmux split-window -p 33 $EDITOR $@ || exit
  else
    echo "peek must be run inside tmux"
  fi
}

# ascii weather over http https://github.com/chubin/wttr.in
wttr()
{
    curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Adelaide}"
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


# edit today's journal entry
today() {
  nvim "$HOME/wiki/diary/$(date +%F).wiki"
}

# open quick note with title
zet() {
  # fname=$(sed 's/ /-/' <<< $@)
  # nvim "$HOME/wiki/$(date +%F-%H%M)-${fname}.wiki"
  nvim --cmd 'let g:startify_disable_at_vimenter = 1' "+Zetedit $*"
}

mksrcinfo() {
  makepkg --printsrcinfo > .SRCINFO
}

# zsh config local to this machine (stored in host dir in dotfiles)
[[ -f ~/.zshrc_host ]] && . ~/.zshrc_host

# anything local to this machine (not stored in dotfiles)
[[ -f ~/.zshrc_local ]] && . ~/.zshrc_local

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zprof
