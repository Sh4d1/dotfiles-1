#!/bin/sh
# from https://github.com/wincent/wincent/blob/master/roles/dotfiles/files/.mutt/scripts/view_mail.sh
# by Gregg Hurrell (wincent)

COLUMNS=${COLUMNS:-`tput cols`}
TMPFILE="$1"

# Need to copy the file because mutt will delete it before Vim can read it.
DIR=$(mktemp -d)
cp "$TMPFILE" "$DIR/preview"
TMPFILE="$DIR/preview"

if [ -z "$TMUX" ]; then
  nvim '+set filetype=mail' '+set nofoldenable' '+set nomodifiable' "$TMPFILE"
elif [ "$COLUMNS" -gt 180 ]; then
  tmux split-window -p 50 -h \
    nvim '+set filetype=mail' '+set nofoldenable' '+set nomodifiable' "$TMPFILE"
else
  tmux split-window -p 50 -v \
    nvim '+set filetype=mail' '+set nofoldenable' '+set nomodifiable' "$TMPFILE"
fi
