#!/usr/bin/bash

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

#### run startup programs

# keyboard options
#setxkbmap -option compose:ralt
#setxkbmap -variant dvorak
#xset r rate 175 80


# sound
#start-pulseaudio-x11

# set up multihead
#xrandr --output HDMI1 --auto --pos 0x0 --output VGA1 --auto --pos 1920x180
#xrandr --output HDMI1 --primary


#choose desktop from first argument 
session=${2:-kde}

case $session in
    #awesome) 
        #exec awesome 
        #;;
    gnome)
        exec gnome-session
        ;;
    kde)
        exec startkde # with awesome stuck on top
        ;;
    cinnamon)
        exec cinnamon-session
        ;;
    *) 
        exec startkde
        ;;
esac

