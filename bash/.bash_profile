# Keyboard settings (base.lst file has the instructions)
# us and ru layouts
# S - <space> to change layout
# Capslock LED shows that ru layout is active
# Compose key on left ctrl
# Capslock as ctrl
setxkbmap -layout us,ru -option grp:win_space_toggle,grp_led:caps,compose:lctrl,caps:ctrl_modifier

# Screen settings
xrandr --output eDP-1 --mode 1920x1080 --brightness 1

emacs &
owncloud &

# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
