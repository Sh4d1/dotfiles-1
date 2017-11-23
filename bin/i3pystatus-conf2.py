#!/usr/bin/env python3

from i3pystatus import Status

## CUSTOM MODULE TO GET PUBLIC IP ADDRESS
from i3pystatus import IntervalModule
import requests
import time


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
    color = "#0088EE"
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
            format=("%Y-%m-%d %H:%M:%S UTC", 'Etc/UTC'))

status.register(public_ip,
                format='ip: {ip}',
                err_format='no ip: {ip}',
                interval=2400,)

status.register('openvpn',
                format='vpn: {vpn_name} {status}',
                color_up='#93a1a1',
                color_down='#93a1a1',
                status_up='<span color="#859900">▲</span>',
                status_down='<span color="#dc322f">▼</span>',
                use_new_service_name=True,
                vpn_name='pia-mel',
                on_rightclick='vpn_down_command',
                hints={'markup': 'pango'},
                interval=10,)

status.register(local_temperature,
                interval=300)

status.run()
