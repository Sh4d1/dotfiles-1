
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config = config  # type: ConfigAPI # noqa: F821
c = c  # type: ConfigContainer # noqa: F821

# config.load_autoconfig()


# normal mode bindings

# easy open pages from the internet archive
config.bind(',b', 'spawn --userscript pinboard_add.sh')

config.bind(',f', 'spawn --userscript wordreference_fr.sh')
config.bind(',w', 'spawn --userscript wallabag_add.sh')
config.bind(',z', 'jseval javascript:var d=document,s=d.createElement("script");s.src="https://www.zotero.org/bookmarklet/loader.js";(d.body?d.body:d.documentElement).appendChild(s);void(0);')
config.bind(';wa', 'hint links fill :open -t https://web.archive.org/web/{hint-url}')
config.bind(';x', 'hint links spawn nohup mpv {hint-url}')
config.bind('gw', 'tab-detach')
config.bind('wa', 'open https://web.archive.org/web/{url}')
config.bind('x', 'spawn nohup mpv {url}')


# insert mode bindings
config.bind('<ctrl-w>', 'fake-key <ctrl-backspace>', mode='insert')
config.bind('<ctrl-h>', 'fake-key <backspace>', mode='insert')

# settings
c.content.geolocation = False
c.content.headers.accept_language = 'en-AU,en'
c.content.user_stylesheets = [str(config.configdir / 'userstyles.css')]
c.downloads.open_dispatcher = 'rifle'
c.editor.command = ['gui-editor.sh', '{}']
c.fonts.completion.entry = '8pt monospace'
c.fonts.monospace = 'Hack, "DejaVu Sans Mono", Terminus, Monospace, Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Liberation Mono", "Courier New", Courier, monospace, Fixed, Consolas, Terminal'
c.hints.chars = 'hutenosadi'
c.scrolling.bar = False
c.spellcheck.languages = []
c.tabs.background = True
c.tabs.position = 'left'
c.tabs.width.bar = '15%'
c.url.start_pages = 'https://walladge.net'
c.zoom.default = '80%'
