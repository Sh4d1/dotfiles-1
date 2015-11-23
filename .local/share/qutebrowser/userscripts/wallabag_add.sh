#! /usr/bin/bash

# printf for more consistant approach, `-w 0` disables auto line wrapping in base64
printf "open -t https://www.framabag.org/u/swalladge/?action=add&autoclose=true&url='`printf $QUTE_URL | base64 -w 0`'" >> "$QUTE_FIFO"
