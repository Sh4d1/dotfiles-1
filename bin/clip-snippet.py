#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright © 2017 Samuel Walladge
# fuzzy search for text snippets to copy to clipboard
# depends on PyYaml, rofi, xsel, and a yaml file containing key:snippet pairs

import yaml
import sys
import subprocess

if len(sys.argv) < 2:
    print('Usage: clip-snippet.py YAML_DB_FILENAME')
    sys.exit()

db_filename = sys.argv[1] if len(sys.argv) > 1 else None

try:
    # { 'name': 'snippet' }
    db = yaml.load(open(db_filename))
except Exception as e:
    print('Failed to load database file ({!r})!'.format(db_filename))
    print('Ensure that it exists and is a valid yaml file.\n')
    print(e)
    sys.exit(-1)


keys = '\n'.join(db.keys())
result = subprocess.run(['rofi', '-dmenu', '-no-custom', '-p', 'snippet:'], input=keys, stdout=subprocess.PIPE, encoding='utf-8')
if result.returncode != 0:
    sys.exit(-1)

key = result.stdout.strip()
snippet = db.get(key, None)
if snippet is None:
    sys.exit(-1)

# copy to primary and clipboard selection
subprocess.run(['xsel', '-ip'], encoding='utf-8', input=str(snippet))
subprocess.run(['xsel', '-ib'], encoding='utf-8', input=str(snippet))
