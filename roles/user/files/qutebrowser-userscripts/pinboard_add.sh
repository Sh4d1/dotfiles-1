#! /usr/bin/bash

echo "open -t https://pinboard.in/add/?showtags=yes&url=$QUTE_URL&title=$QUTE_TITLE&next=https%3A%2F%2Fpinboard.in%2Fu%3Aswalladge" >> "$QUTE_FIFO"
