#!/bin/bash

# inspired by https://gitlab.com/rawkode/saltstack-dotfiles/

# http://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
cd "$DIR"

# copy and edit the custom configuration if not already
CUSTOM_CONF="pillar/custom.sls"
if [ ! -f "$CUSTOM_CONF" ]; then
  cp pillar/default.sls "$CUSTOM_CONF"
  vi "$CUSTOM_CONF"
fi

# automatically set up the user and home variables
sudo salt-call --local --config=./salt-config --state-output=changes grains.setvals \
  "{ \"USER\": \"$(whoami)\", \"HOME\": \"$HOME\", \"GROUP\": \"$(id -ng)\" }"

# run it in test mode to check changes
echo "Running in test mode - check below changes before applying!"
sudo salt-call --local --config=./salt-config --state-output=changes --log-level=quiet state.highstate test=true

# prompt to actually do it
printf 'Ok to actually perform changes? [Y/n] '
read OK
if [ "$OK" = "" -o "$OK" = "y" -o "$OK" = "Y" ]; then
  # do it!
  sudo salt-call --local --config=./salt-config --state-output=changes --log-level=quiet state.highstate
else
  echo 'Quitting. No changes have been made.'
fi
