#!/bin/bash

# retrieves the encrypted password for vdirsyncer (for contacts/calendar)
gpg --quiet --for-your-eyes-only --no-tty --decrypt ~/.vdirsyncer-main.gpg
