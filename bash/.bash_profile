# keyboard settings (base.lst file has the instructions)
# us and ru layouts
# S - <space> to change layout
# capslock LED shows that ru layout is active
# compose key on left ctrl
# capslock as ctrl
setxkbmap -layout us,ru -option grp:win_space_toggle,grp_led:caps,compose:lctrl,caps:ctrl_modifier

# swap backspace and \| on my external keyboard
if [ -d "/run/udev/links/\\x2finput\\x2fby-id\\x2fusb-CATEX_TECH._66EC-S_CA2017120001-event-kbd" ]
then
    xmodmap -e "keycode 51 = BackSpace"
    xmodmap -e "keycode 22 = backslash bar"
fi

# Screen settings
xrandr --output eDP-1 --mode 1920x1080

# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
