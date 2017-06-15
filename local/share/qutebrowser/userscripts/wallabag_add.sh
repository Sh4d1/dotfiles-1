#! /usr/bin/bash

# for wallabag v1.*
# `-w 0` disables auto line wrapping in base64
# echo "open -t https://www.framabag.org/u/swalladge/?action=add&url='`echo -n "$QUTE_URL" | base64 -w 0`'" >> "$QUTE_FIFO"


# v2.*
echo "open -t https://framabag.org/bookmarklet?url=$QUTE_URL" >> "$QUTE_FIFO"
