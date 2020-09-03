# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# added by Nix installer
if [ -e /home/aadcg/.nix-profile/etc/profile.d/nix.sh ]
then . /home/aadcg/.nix-profile/etc/profile.d/nix.sh
fi

if [ "$(tty)" = "/dev/tty2" ]; then exec sway; fi

export MOZ_ENABLE_WAYLAND=1
