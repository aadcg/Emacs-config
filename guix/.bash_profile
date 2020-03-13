# swap backspace and \| on my external keyboard
# if [ -d "/run/udev/links/\\x2finput\\x2fby-id\\x2fusb-CATEX_TECH._66EC-S_CA2017120001-event-kbd" ]
# then
#     xmodmap -e "keycode 51 = BackSpace"
#     xmodmap -e "keycode 22 = backslash bar"
#     # xmodmap -e "keycode 22 = BackSpace"
#     # xmodmap -e "keycode 51 = backslash bar"
# fi

# Screen settings
# xrandr --output eDP-1 --mode 1920x1080

# turn off wireless LED
# sudo light -s sysfs/leds/ath9k_htc-phy0 -S 0

# if running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then exec sway; fi

# export ALTERNATE_EDITOR=""
# export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
# export VISUAL="emacsclient -c -a emacs" # $VISUAL opens in GUI mode

# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# added by Nix installer
if [ -e /home/aadcg/.nix-profile/etc/profile.d/nix.sh ]
then . /home/aadcg/.nix-profile/etc/profile.d/nix.sh
fi
