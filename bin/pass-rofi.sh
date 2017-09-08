#!/usr/bin/env bash

# partly copied from https://git.zx2c4.com/password-store/tree/contrib/dmenu
# search for a password and copy to primary clipboard
# note - primary clipboard usually not stored by clipboard managers
# args passed to rofi

shopt -s nullglob globstar

if [ "$1" = "type" ]; then
  MODE="type"
else
  MODE="copy"
fi

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu -i -p "pass ($MODE): " "$@")

[[ -n $password ]] || exit

# copy to primary clipboard
if [ "$MODE" = "type" ]; then
  xdotool type -- "`gopass show "$password" | head -n 1`"
else
  gopass show "$password" | head -n 1 | tr -d '\n' | xsel -ip
fi

