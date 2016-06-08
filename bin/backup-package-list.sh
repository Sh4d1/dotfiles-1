#!/bin/bash
# backup a list of installed packages to a file

FILE=~/Documents/`hostname`-installed-packages.txt
echo "saving to $FILE"

echo "# Packages from repos" > $FILE
pacman -Qenq >> $FILE

echo "" >> $FILE
echo "# Packages from aur" >> $FILE
pacman -Qemq >> $FILE

