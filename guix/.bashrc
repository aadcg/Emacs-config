# Bash initialization for interactive non-login shells and for remote shells
# (info "(bash) Bash Startup Files").

# Export 'SHELL' to child processes.  Programs such as 'screen' honor it and
# otherwise use /bin/sh.
export SHELL

if [[ $- != *i* ]]
then
    # We are being invoked from a non-interactive shell.  If this is an SSH
    # session (as in "ssh host command"), source /etc/profile so we get PATH and
    # other essential variables.
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
    PS1='\[\033[1;32m\]\u@\h \[\033[1;34m\]\w \[\033[1;31m\][env] \[\033[0;37m\]\$ '
else
    PS1='\[\033[1;32m\]\u@\h \[\033[1;34m\]\w \[\033[0;37m\]\$ '
fi

# Alias
alias ls='ls --color=auto'
alias ll='ls -Atrhlb'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree="find . -type d -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Infinite history, ignore duplicates and lines starting with a space
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL=ignoreboth:erasedups

# If set, the history list is appended to the file named by the value of the
# HISTFILE variable when the shell exits, rather than overwriting the file.
shopt -s histappend

# If set, the pattern ** used in a path name expansion context will match all
# files and zero or more directories and subdirectories. If the pattern is
# followed by a /, only directories and subdirectories match.
shopt -s globstar

# If set, a command name that is the name of a directory is executed as if it
# were the argument to the 'cd' command. This option is only used by interactive
# shells.
shopt -s autocd

# If set, minor errors in the spelling of a directory component in a 'cd'
# command will be corrected. The errors checked for are transposed characters, a
# missing character, and a character too many. If a correction is found, the
# corrected path is printed, and the command proceeds. This option is only used
# by interactive shells.
shopt -s cdspell
