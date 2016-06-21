
typeset -U path
path=(~/bin ~/.local/bin $(ruby -e 'print Gem.user_dir')/bin $path[@])

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi
