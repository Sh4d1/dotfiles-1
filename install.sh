#!/bin/bash

# inspired by https://gitlab.com/rawkode/saltstack-dotfiles/

set -e

# http://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
cd "$DIR"

# make sure saltstack is installed
echo "INSTALLER: Attempting to detect package manager and install salt"
if [ -z "`command -v salt-call`" ]; then
  # install saltstack
  if [ -n "`command -v pacman`" ]; then
    sudo pacman -S salt
  elif [ -n "`command -v dnf`" ]; then
    sudo dnf install salt-minion
  else
    echo "INSTALLER: Please manually install salt before continuing"
    exit 1
  fi
fi

# copy and edit the custom configuration if not already
CUSTOM_CONF="pillar/custom.sls"
if [ ! -f "$CUSTOM_CONF" ]; then
  cp pillar/default.sls "$CUSTOM_CONF"
  if [ -z "$EDITOR" ]; then
    printf 'INSTALLER: EDITOR not set - type the editor to use temporarily: '
    read $EDITOR
    export $EDITOR
  fi
  $EDITOR "$CUSTOM_CONF"
else
  echo "INSTALLER: pillar/custom.sls already exists - don't forget to edit to modify variables"
fi

# automatically set up the user and home variables
sudo salt-call --local --config=./salt-config --state-output=changes grains.setvals \
  "{ \"USER\": \"$(whoami)\", \"HOME\": \"$HOME\", \"GROUP\": \"$(id -ng)\" }"

# run it in test mode to check changes
echo "INSTALLER: Running in test mode - check below changes before applying!"
sudo salt-call --local --config=./salt-config --state-output=changes --log-level=quiet state.highstate test=true

# prompt to actually do it
printf 'Ok to actually perform changes? [y/N] '
read OK
if [ "$OK" = "yes" -o "$OK" = "y" -o "$OK" = "Y" ]; then
  # do it!
  sudo salt-call --local --config=./salt-config --state-output=changes --log-level=quiet state.highstate
else
  echo 'INSTALLER: Quitting. No changes have been made.'
fi
