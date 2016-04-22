#!/usr/bin/zsh

sleep 3 && {ps aux | grep -v 'grep' | grep -e 'termite --title consoleapps' || termite --title consoleapps -e "tmuxinator start apps"}

