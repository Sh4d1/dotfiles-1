#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright © 2017 Samuel Walladge
# fuzzy search for text snippets to copy to clipboard
# depends on PyYaml, rofi, xsel, xdotool, and a yaml file containing key:snippet pairs

import yaml
import sys
import subprocess

# import things here to use in snippets
import time

COPY = 'copy'
TYPE = 'type'

if len(sys.argv) < 3:
    print('Usage: clip-snippet.py copy|type YAML_DB_FILENAME')
    sys.exit()

mode = sys.argv[1]
db_filename = sys.argv[2]

if mode not in (COPY, TYPE):
    print('Invalid mode! Must be either copy or type.')
    sys.exit(-1)


try:
    # { 'name': 'snippet' }
    db = yaml.load(open(db_filename))
except Exception as e:
    print('Failed to load database file ({!r})!'.format(db_filename))
    print('Ensure that it exists and is a valid yaml file.\n')
    print(e)
    sys.exit(-1)


keys = '\n'.join(db.keys())
result = subprocess.run(['rofi', '-dmenu', '-no-custom', '-p', 'snippet', '-matching', 'fuzzy'],
        input=keys, stdout=subprocess.PIPE, encoding='utf-8')
if result.returncode != 0:
    sys.exit(-1)

key = result.stdout.strip()
snippet = db.get(key, None)
out = ''

# invalid, drop out
if snippet is None:
    sys.exit(-1)

# more processing?
elif type(snippet) == dict:
    # run as a python snippet
    if snippet.get('type', '') == 'python':
        out = str(eval(snippet.get('eval')))

    # otherwise, drop out
    else:
        sys.exit(-1)

# just use the snippet contents as the value
else:
    out = str(snippet)

# copy to primary and clipboard selection
if mode == COPY:
    subprocess.run(['xsel', '-ip'], encoding='utf-8', input=out)
    subprocess.run(['xsel', '-ib'], encoding='utf-8', input=out)
elif mode == TYPE:
    subprocess.run(['xdotool', 'type', '--clearmodifiers', '--', out], encoding='utf-8')
