#!/usr/bin/env python3

from i3pystatus import Status
from i3pystatus.mail import maildir
import os

status = Status()

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
                format="%Y-%m-%d %H:%M:%S")

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load")

status.register("cpu_usage",
                format="CPU {usage:3.0f}%")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
                alert_temp=70,
                file="/sys/class/hwmon/hwmon1/temp1_input",
                format="Core: {temp:.0f}°C",)
status.register("temp",
                alert_temp=70,
                format="{temp:.0f}°C",)


# Shows the address and up/down state of eth0.
# If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
                interface="eno1",
                format_up="{v4cidr} {bytes_recv}KiBs down | {bytes_sent}KiBs up",)



# Shows disk usage of /
status.register("disk",
                path="/",
                format="Home {avail}G",)

status.register("disk",
                path="/mnt/storage/",
                format="Storage {avail}G",)


# Shows pulseaudio default sink volume
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
                format="♪ {volume}%",)

status.register("mail",
        backends=[maildir.MaildirMail(
            directory=os.path.join(os.path.expanduser('~'), 'Maildir/INBOX/'))],
        format="MAIL: {unread}",format_plural="MAIL: {unread}")

status.register("now_playing",
                format="{status} {title} - {album}",
                color="#7070ff")


status.run()
