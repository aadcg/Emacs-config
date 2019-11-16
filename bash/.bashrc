# Bash initialization for interactive non-login shells and
# for remote shells (info "(bash) Bash Startup Files").

# Export 'SHELL' to child processes.  Programs such as 'screen'
# honor it and otherwise use /bin/sh.
export SHELL

if [[ $- != *i* ]]
then
    # We are being invoked from a non-interactive shell.  If this
    # is an SSH session (as in "ssh host command"), source
    # /etc/profile so we get PATH and other essential variables.
    [[ -n "$SSH_CLIENT" ]] && source /etc/profile

    # Don't do anything else.
    return
fi

# Source the system-wide file.
source /etc/bashrc

# Adjust the prompt depending on whether we're in 'guix environment'.
if [ -n "$GUIX_ENVIRONMENT" ]
then
    PS1='\u@\h \w [env] \n\$ '
else
    PS1='\u@\h \w \n\$ '
fi

# alias
alias tree="find . -type d -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias ll='ls -Athlb --color=auto'
alias ls='ls --color=auto'

# infinite history, ignore duplicates and lines starting with a space
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar
