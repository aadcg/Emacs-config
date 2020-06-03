# Bash initialization for interactive non-login shells and for remote
# shells (info "(bash) Bash Startup Files").

# Export 'SHELL' to child processes. Programs such as 'screen' honor it
# and otherwise use /bin/sh.
export SHELL

if [[ $- != *i* ]]
then
    # We are being invoked from a non-interactive shell. If this is an
    # SSH session (as in "ssh host command"), source /etc/profile so we
    # get PATH and other essential variables.
    [[ -n "$SSH_CLIENT" ]] && source /etc/profile

    # Don't do anything else.
    return
fi

# Source the system-wide file if exists
if [ -f "/etc/bashrc" ]
then
    source /etc/bashrc
fi

# Adjust the prompt depending on whether we're in 'guix environment'.
if [ -n "$GUIX_ENVIRONMENT" ]
then
    PS1='\u@\h \w [env] \$ '
else
    PS1='\u@\h \w \$ '
fi

# Alias
alias ls='ls --color=auto'
alias ll='ls -Atrhlb --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree="find . -type d -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Infinite history, ignore duplicates and lines starting with a space
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
export HISTCONTROL=ignoreboth

# If set, the pattern ** used in a path name expansion context will
# match all files and zero or more directories and subdirectories. If
# the pattern is followed by a /, only directories and subdirectories
# match.
shopt -s globstar

# If set, a command name that is the name of a directory is executed as
# if it were the argument to the 'cd' command. This option is only used
# by interactive shells.
shopt -s autocd

# If set, minor errors in the spelling of a directory component in a
# 'cd' command will be corrected. The errors checked for are transposed
# characters, a missing character, and a character too many. If a
# correction is found, the corrected path is printed, and the command
# proceeds. This option is only used by interactive shells.
shopt -s cdspell
