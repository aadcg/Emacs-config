# alias
alias tree = find . -type d -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
alias ll = 'ls -Athlb'

# infinite history, ignore duplicates and lines starting with a space
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend
