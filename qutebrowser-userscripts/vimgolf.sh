#! /usr/bin/zsh

export NODE_PATH="/usr/lib/node_modules"
export PATH=~/bin:~/.local/bin:~/.node_modules/bin:~/.gem/ruby/2.3.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

CHALLENGE_ID=`get_vimgolf_id "$QUTE_HTML"`

# notify-send "vimgolf starting $CHALLENGE_ID"
# check if key empty before running

[ -n "$CHALLENGE_ID" ] && termite -t "POPUP1" -e "zsh -i -c 'vimgolf put $CHALLENGE_ID'"
