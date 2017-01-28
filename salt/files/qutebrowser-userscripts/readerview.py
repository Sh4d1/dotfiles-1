#! /usr/bin/env python3
# Copyright © 2016 Samuel Walladge
#
# Transforms the current webpage in qutebrowser into a clean, readable version.
# (similar to that of firefox reader view, but faster and less features)
# Prerequisites:
# - pip install readability-lxml
# - :bind <key sequence> spawn --userscript readerview.py

from readability.readability import Document
import os
import tempfile

# use readability-lxml (https://pypi.python.org/pypi/readability-lxml) to
# extract the article text
html = open(os.environ.get('QUTE_HTML')).read()
url = os.environ.get('QUTE_URL')

# set the url kwarg to get absolute links
document = Document(html, url=url)
article = document.summary()
title = document.title()

# add styling and whatever for better reading
head = '''<html>
<head>
<title>''' + title + ''' [readerview]</title>
<style>
body {
 max-width: 1000px;
 margin: 0 auto;
 background-color: #002b36;
 color: #839496;
 // background-color: #fdf6e3;
 // color: #657b83;
}
#qute_orig_link {
 font-weight: bold;
 text-align: center;
 width: 100%;
 margin: 3rem 0;
}
</style>
</head>
<body>
<div id="qute_orig_link">
 <h1>''' + title + '''</h1>
 <a href="''' + url + '''">View original page.</a>
</div>
'''

article = head + article[12:]

# create a temporary file to open with qutebrowser
fd, name = tempfile.mkstemp(suffix='.html')

# write the article to the file
with open(name, 'w') as f:
    f.write(article)

# tell qute to open the article!
with open(os.environ.get('QUTE_FIFO'), 'w') as fifo:
    fifo.write('open {}'.format(name))
