#!/usr/bin/env python3

from i3pystatus import IntervalModule, Status
from i3pystatus.mail import maildir
import os
import time
import requests

class local_temperature(IntervalModule):
    """
    Retrieves local temperature from rpi-temperature-server running on my RPi

    Requires pypi package `requests`.

    .. rubric:: Available formatters

    * `{temp}` - current temperature
    * `{min}` - 24 hour min
    * `{max}` - 24 hour max
    """

    format = "{temp:0.1f}°C | 24h min: {min:0.1f}°C, max: {max:0.1f}°C"
    err_format = "error"
    color = "#b58900"
    alert_color = "#FF0000"

    settings = (
        ("format", "format string used for output."),
        ("err_format", "format string used for when can't retrieve the temperature."),
        ("color", "standard color"),
        ("alert_color",
         "defines the color used when failed to retrieve public ip")
    )

    def run(self):
        cdict = {
            'temp': float('Inf'),
            'min': float('Inf'),
            'max': float('Inf')
        }

        try:
            limit = int(time.time()) - (60*60*24)
            params = {'from': limit}
            current_res = requests.get('http://pi-1:8888/api/temperature/current', timeout=5)
            stats_res = requests.get('http://pi-1:8888/api/temperature/stats', params=params, timeout=5)

            assert current_res.status_code == stats_res.status_code == 200

            cdict['temp'] = current_res.json()['data']['temperature']
            cdict['min'] = stats_res.json()['data']['min']['temperature']
            cdict['max'] = stats_res.json()['data']['max']['temperature']

            self.output = {
                "full_text": self.format.format(**cdict),
                "color": self.color
            }
        except Exception as e:
            self.output = {
                "full_text": self.err_format.format(**cdict),
                "color": self.alert_color
            }

        self.data = cdict

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
                file="/sys/class/hwmon/hwmon0/temp1_input",
                format="{temp:.0f}°C",)
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

status.register("backlight",
                interval=5,
                format="Backlight {percentage}%")

status.register("mail",
        backends=[maildir.MaildirMail(
            directory=os.path.join(os.path.expanduser('~'), 'Maildir/INBOX/'))],
        format="MAIL: {unread}",format_plural="MAIL: {unread}")

# status.register("cmus",
#                 format="{status} {title:.27s} - {artist:.18s}",
#                 color="#7070ff")
#
status.register(local_temperature,
        format='☀ {temp:0.1f}°C',
                interval=300)

status.run()
