config.load_autoconfig()

# easy open pages from the internet archive
config.bind('wa', 'open https://web.archive.org/web/{url}')
config.bind(';wa', 'hint links fill :open -t https://web.archive.org/web/{hint-url}')
