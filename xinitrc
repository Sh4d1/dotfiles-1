#!/usr/bin/zsh

#source resources
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec i3

#choose desktop from first argument 
#session=${2:-i3}
#
#case $session in
#    awesome) 
#        exec awesome 
#        ;;
#    i3)
#        exec i3
#        ;;
#    kde)
#        exec startkde
#        ;;
#    cinnamon)
#        exec cinnamon-session
#        ;;
#    *) 
#        # exec startkde
#        true
#        ;;
#esac
#
