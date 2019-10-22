# alias
alias tree = find . -type d -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
alias ll = 'ls -Athlb'

# infinite history, ignore duplicates and lines starting with a space
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# Adjust the prompt depending on whether we're in 'guix environment'.
if [ -n "$GUIX_ENVIRONMENT" ]
then
    PS1='\u@\h \w [env]\$ '
else
    PS1='\u@\h \w\$ '
fi
