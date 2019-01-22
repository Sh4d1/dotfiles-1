# swalladge 2019
#
# wikilink completion for my markdown wiki

import os
import re
from os.path import relpath, dirname
import glob

from deoplete.source.base import Base
from deoplete.util import expand


class Source(Base):

    def __init__(self, vim):
        super().__init__(vim)

        self.vim = vim
        self.name = 'wiki_files'
        self.mark = '[WL]' # WikiLink
        self.min_pattern_length = 0
        self.rank = 450
        self.filetypes = ['wiki.markdown']

    def get_complete_position(self, context):
        pos = context['input'].rfind('[[')
        return pos if pos < 0 else pos + 2

    def gather_candidates(self, context):
        contents = []
        path = '/home/samuel/wiki/'
        len_path = len(path)

        cur_file_dir = dirname(self.vim.buffers[context['bufnr']].name)

        for fname in glob.iglob(path + '**/*', recursive=True):
            fname = relpath(fname, cur_file_dir)

            if fname.endswith('.md'):
                fname = fname[:-3]

            contents.append(fname)

        return contents
