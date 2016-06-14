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
article = Document(html).summary()

# create a temporary file to open with qutebrowser
fd, name = tempfile.mkstemp(suffix='.html')

# write the article to the file
with open(name, 'w') as f:
    f.write(article)

# tell qute to open the article!
with open(os.environ.get('QUTE_FIFO'), 'w') as fifo:
    fifo.write('open {}'.format(name))
