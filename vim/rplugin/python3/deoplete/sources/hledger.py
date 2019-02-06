# swalladge 2019
#
# hledger completion for my ledger. very not portable
#
# accounts are cached, so restart vim to refresh ¯\_(ツ)_/¯

import subprocess

from deoplete.source.base import Base
from deoplete.util import expand


class Source(Base):

    def __init__(self, vim):
        super().__init__(vim)

        self.vim = vim
        self.name = 'hledger_accounts'
        self.mark = '[ACC]' # ACCOUNT
        self.rank = 450
        self.min_pattern_length = 100 # to prevent 
        self.filetypes = ['ledger']
        self.accounts = []
        self.input_pattern = r'^    ([\w:-]|[\w:-]\s[\w:-])+'

    def get_complete_position(self, context):
        # accounts always indented by 4 spaces
        return 4

    def gather_candidates(self, context):
        return self._get_accounts_cached()

    def _get_accounts_cached(self):
        if self.accounts:
            return self.accounts

        # otherwise, populate and return.
        # Pulls directly from accounts file to avoid issues with hledger
        # needing to parse a possibly invalid (because currently being edited)
        # main ledger file.
        proc = subprocess.run(['hledger', 'accounts', '-f', '/home/samuel/ledger/accounts.ledger'],
                stdout=subprocess.PIPE, text=True, check=True)

        self.accounts = list(map(lambda x:x.strip(), proc.stdout.split('\n')))
        return self.accounts
