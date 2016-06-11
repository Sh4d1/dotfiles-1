#!/bin/bash
# kills the current tmux session and let's you choose another session
# won't kill if is only session running

SESSION=`tmux list-panes -F '#{session_name}'`
if tmux switch-client -p && tmux kill-session -t $SESSION; then
  if [ `tmux list-sessions | wc -l` -gt 1 ]; then
    tmux choose-session;
  fi
else
  tmux kill-session
fi

# exit cleanly to avoid output in tmux
true

