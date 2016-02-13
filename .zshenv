
typeset -U path
path=($(ruby -e 'print Gem.user_dir')/bin $path[@] ~/bin)

BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_PROMPT_CHAR=''
BULLETTRAIN_TIME_SHOW=false
BULLETTRAIN_DIR_EXTENDED=0

EDITOR="vim"
TERMINAL="termite"
BROWSER="qutebrowser"
_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
JAVA_FONTS=/usr/share/fonts/TTF
MAIL=~/Maildir


