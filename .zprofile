
source "$HOME/.pathrc"

# if [ -n "$DESKTOP_SESSION" ]; then
if hash gnome-keyring-daemon; then
  eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
  export SSH_AUTH_SOCK
  echo $SSH_AUTH_SOCK > "$HOME/.ssh_auth_sock"
fi
# fi
