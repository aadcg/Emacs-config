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

bind Space:magic-space

# setxkbmap -layout us,ru -option grp:win_space_toggle,grp_led:caps,compose:lctrl,caps:ctrl_modifier

# xrandr --output eDP-1 --mode 1920x1080 --brightness 1
