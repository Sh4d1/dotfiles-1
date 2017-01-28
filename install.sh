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

sudo salt-call --local --config=./salt-config --state-output=changes grains.setvals \
  "{ \"USER\": \"$(whoami)\", \"HOME\": \"$HOME\", \"GROUP\": \"$(id -ng)\" }"

sudo salt-call --local --config=./salt-config --state-output=changes --log-level=quiet state.highstate
