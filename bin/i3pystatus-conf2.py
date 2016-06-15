#!/usr/bin/env python3

from i3pystatus import Status

## CUSTOM MODULE TO GET PUBLIC IP ADDRESS
from i3pystatus import IntervalModule
import requests


class public_ip(IntervalModule):
    """
    Retrieves public ip address (using httpbin.org).

    Requires pypi package `requests`.

    .. rubric:: Available formatters

    * `{ip}` - current public ip address (or 'err')
    """

    format = "{ip}"
    err_format = ""
    color = "#00FF00"
    alert_color = "#FF0000"

    settings = (
        ("format", "format string used for output."),
        ("err_format", "format string used for when can't retrieve public ip."),
        ("color", "standard color"),
        ("alert_color",
         "defines the color used when failed to retrieve public ip")
    )

    def run(self):
        cdict = {
            'ip': 'err'
        }

        try:
            res = requests.get('https://httpbin.org/ip', timeout=5)

            if res.status_code == 200:
                cdict['ip'] = res.json()['origin']

                self.output = {
                    "full_text": self.format.format(**cdict),
                    "color": self.color
                }
        except:
            self.output = {
                "full_text": self.err_format.format(**cdict),
                "color": self.alert_color
            }

        self.data = cdict



status = Status()

# Displays clock
status.register("clock",
                format="%Y-%m-%d %H:%M:%S")

status.register(public_ip,
                format='ip: {ip}',
                err_format='no ip: {ip}',
                interval=2400,)
                

status.run()
