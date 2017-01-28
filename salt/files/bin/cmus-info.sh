#!/usr/bin/zsh

INFO=`cmus-remote -Q`

ARTIST=`echo $INFO | grep -e "^tag artist " | cut -d " " -f 3-`
TITLE=`echo $INFO | grep -e "^tag title " | cut -d " " -f 3-`
STATUS=`echo $INFO | grep '^status' | cut -d " " -f 2`

LEN=`echo $INFO | grep -e "^duration " | cut -d " " -f 2`
POS=`echo $INFO | grep -e "^position " | cut -d " " -f 2`

echo "♫ $STATUS [$((($POS*100)/$LEN))%]" "$TITLE - $ARTIST"

# notify-send -a cmus "CMUS: $STATUS [$((($POS*100)/$LEN))%]" "$TITLE by $ARTIST"
