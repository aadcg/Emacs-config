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

# (info "(bash) Aliases")
alias ls='ls --color=auto'
alias ll='ls -Atrhlb --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias zoom='flatpak run us.zoom.Zoom'
alias jitsi='flatpak run org.jitsi.jitsi-meet'
# alias tree="find . -type d -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# (info "(bash) Bash History Facilities")
# (info "(bash) Bash Variables")
export HISTSIZE=1000000 # not set to -1 (infinite) because of eshell
export HISTFIL=~/.bash_history
export HISTCONTROL=ignoreboth

# (info "(bash) The Shopt Builtin")
shopt -s globstar
shopt -s autocd
shopt -s cdspell
shopt -s expand_aliases
