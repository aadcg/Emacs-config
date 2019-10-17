alias tree = find . -type d -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
alias l = 'ls -Athlb'
