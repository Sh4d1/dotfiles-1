#!/usr/bin/env python3

from i3pystatus import Status

status = Status()

# Displays clock
status.register("clock",
                format="%Y-%m-%d %H:%M:%S")


status.run()
