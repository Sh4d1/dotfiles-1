#!/usr/bin/env python3

from i3pystatus import Status

status = Status()

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
                format="%Y-%m-%d %H:%M:%S")

# This would look like this:
# Discharging 6h:51m
status.register("battery",
                format="⚡ {percentage:2.1f}% {remaining:%E%hh:%Mm} {status}",
                alert=True,
                alert_percentage=5,
                status={
                    "DIS":  "↓",
                    "CHR":  "↑",
                    "FULL": "→",
                },)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load")

status.register("cpu_usage",
                format="CPU {usage:3.0f}%")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
                alert_temp=70,
                format="{temp:.0f}°C",)


# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
                interface="wlp3s0",
                format_up="{v4cidr}",)
                #format_up="{essid} {v4cidr} {network_graph}",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
                path="/",
                format="Home {avail}G",)


# Shows pulseaudio default sink volume
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
                format="♪ {volume}%",)

status.register("cmus",
                format="{status} {title:.27s} - {artist:.18s}",
                color="#7070ff")


status.run()
