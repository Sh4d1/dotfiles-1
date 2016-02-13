if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  REMOTE_SESSION=true
# else
#   case $(ps -o comm= -p $PPID) in
#     sshd|*/sshd|mosh-session) REMOTE_SESSION=true;;
#   esac
fi

if [ -n "$REMOTE_SESSION" ]; then
  # BULLETTRAIN_CONTEXT_SHOW=true
  # BULLETTRAIN_IS_SSH_CLIENT=true
  BULLETTRAIN_CUSTOM_MSG="\u26a1 $(hostname)" 
fi
