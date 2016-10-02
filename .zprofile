
source "$HOME/.pathrc"

# if [ -n "$DESKTOP_SESSION" ]; then
if hash gnome-keyring-daemon 2>/dev/null; then
  eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
  export SSH_AUTH_SOCK
  echo $SSH_AUTH_SOCK > "$HOME/.ssh_auth_sock"
fi
# fi
