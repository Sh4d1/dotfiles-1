#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Code based on https://github.com/adnidor/himawaripy
# Depends on PIL and nitrogen
# Modifications by Samuel Walladge 2017

import os
import subprocess
from io import BytesIO
from json import loads
from time import strptime, strftime
from os import makedirs
from os.path import expanduser, split, join
from urllib.request import urlopen

from PIL import Image

# Increases the quality and the size. Possible values: 4, 8, 16, 20
level = 4

# Path to the output file
output_file = expanduser('~/.himawari/himawari-latest.png')

# ==============================================================================

def main():
    width = 550
    height = 550

    print('Updating...')
    with urlopen('http://himawari8-dl.nict.go.jp/himawari8/img/D531106/latest.json') as latest_json:
        latest = strptime(loads(latest_json.read().decode('utf-8'))['date'], '%Y-%m-%d %H:%M:%S')

    print('Latest version: {} GMT'.format(strftime('%Y/%m/%d/%H:%M:%S', latest)))

    url_format = 'http://himawari8.nict.go.jp/img/D531106/{}d/{}/{}_{}_{}.png'

    png = Image.new('RGB', (width*level, height*level))

    print('Downloading tiles: 0/{} completed'.format(level*level))
    for x in range(level):
        for y in range(level):
            with urlopen(url_format.format(level, width, strftime('%Y/%m/%d/%H%M%S', latest), x, y)) as tile_w:
                tiledata = tile_w.read()

            tile = Image.open(BytesIO(tiledata))
            png.paste(tile, (width*x, height*y, width*(x+1), height*(y+1)))

            print('Downloading tiles: {}/{} completed'.format(x*level + y + 1, level*level))
    print('Downloaded')

    # save the original image to a backup dir (so we can keep track of things)
    backup_dir = os.environ.get('HIMAWARI_BACKUP_OLD_DIR')
    if backup_dir:
        print('Saving timestamped backup to {}'.format(backup_dir))
        backup_dir = expanduser(backup_dir)
        makedirs(backup_dir, exist_ok=True)
        png.save(join(backup_dir, strftime('%Y-%m-%d-%H%M%S.png', latest)), 'PNG')

    # put some black padding around the image so the top of earth isn't hidden
    # by the status bar in i3
    magnify = 1.15
    new_size = (int(width*level*magnify), int(height*level*magnify))
    padded_png = Image.new('RGB', new_size)
    padded_png.paste(png, ((new_size[0]-(width*level))//2,
                           (new_size[1]-(height*level))//2))

    makedirs(split(output_file)[0], exist_ok=True)
    padded_png.save(output_file, 'PNG')

    print('Saved to file')

    # refresh the wallpaper
    print('Launching nitrogen')
    subprocess.run(['nitrogen', '--restore'])

if __name__ == '__main__':
    main()
