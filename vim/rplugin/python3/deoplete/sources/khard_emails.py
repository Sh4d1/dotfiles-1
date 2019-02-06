# Source: https://github.com/nicoe/deoplete-khard
# Copyright 2018 nicoe <https://github.com/nicoe>
#
# Copied under the terms of the MIT license
#
# Modifications copyright 2019 swalladge
#
# Modifications include:
#
# - my fix for compatibility with khard v0.13.0 as
#   submitted in PR https://github.com/nicoe/deoplete-khard/pull/2
# - set a rank higher than default because i don't care about other completion
#   when entering email addresses (either i'm manually writing in a new address,
#   or it is saved in khard).

import re

from khard import khard, config
from deoplete.source.base import Base

COLON_PATTERN = re.compile(':\s?')
COMMA_PATTERN = re.compile('.+,\s?')
HEADER_PATTERN = re.compile('^(Bcc|Cc|From|Reply-To|To):(\s?|.+,\s?)')


class Source(Base):

    def __init__(self, vim):
        super().__init__(vim)

        self.name = 'khard'
        self.mark = '[khard]'
        self.min_pattern_length = 2
        self.rank = 500
        self.filetypes = ['mail']

        self.__cache = []

    def get_complete_position(self, context):
        colon = COLON_PATTERN.search(context['input'])
        comma = COMMA_PATTERN.search(context['input'])
        return max(
            colon.end() if colon is not None else -1,
            comma.end() if comma is not None else -1)

    def gather_candidates(self, context):
        if HEADER_PATTERN.search(context['input']):
            if not self.__cache:
                self.__fill_cache()
            return self.__cache

    def __fill_cache(self):
        khard_config = config.Config()

        for vcard in khard.get_contacts(khard_config.abooks, '', 'name', False, False):
            for type, email_list in vcard.get_email_addresses().items():
                for email in email_list:
                    self.__cache.append({'word': "{0} <{1}>".format(
                                vcard.get_first_name_last_name(), email)})
