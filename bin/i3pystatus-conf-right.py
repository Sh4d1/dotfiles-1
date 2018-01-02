#!/usr/bin/env python3

from i3pystatus import Status
from i3pystatus.mail import maildir
import os

status = Status()


# status.register("now_playing",
#                 format="{status} {title} - {artist}",
#                 color="#7070ff")


status.run()
