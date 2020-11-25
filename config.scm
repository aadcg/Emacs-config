(use-modules (gnu)
             (guix packages)
             (srfi srfi-1))
(use-service-modules desktop sddm networking ssh xorg pm nix)
(use-package-modules gnome)

;; Thanks Pierre Neidhardt
(define xorg-touchpad
  "Section \"InputClass\"
  Identifier \"Touchpads\"
  Driver \"libinput\"
  MatchDevicePath \"/dev/input/event*\"
  MatchIsTouchpad \"on\"

  Option \"DisableWhileTyping\" \"on\"
  Option \"MiddleEmulation\" \"on\"
  Option \"ClickMethod\" \"clickfinger\"
  Option \"ScrollMethod\" \"twofinger\"
  Option \"NaturalScrolling\" \"true\"
EndSection")

(define-public gnome-minimal
  (package
    (inherit gnome)
    (name "gnome-minimal")
    (propagated-inputs
     (fold alist-delete (package-propagated-inputs gnome)
           '("gnome-backgrounds"
             "gnome-themes-extra"
             "gnome-getting-started-docs"
             "gnome-user-docs"
             "orca"
             "rygel"
             "baobab"
             "cheese"
             "eog"
             "epiphany"
             "evince"
             "file-roller"
             "gedit"
             "gnome-boxes"
             "gnome-calculator"
             "gnome-calendar"
             "gnome-characters"
             "gnome-clocks"
             "gnome-contacts"
             "gnome-disk-utility"
             "gnome-font-viewer"
             "gnome-maps"
             "gnome-screenshot"
             "gnome-weather"
             "simple-scan"
             "totem"
             "gucharmap"
             "gnome-online-accounts")))))

(operating-system
 (locale "en_US.utf8")
 (timezone "Europe/Moscow")
 ;; (timezone "Europe/Lisbon")
 (keyboard-layout
  (keyboard-layout
   "us,ru" "altgr-intl,"
   #:options
   '("caps:ctrl_modifier"
     "grp:win_space_toggle"
     "grp_led:caps"
     "lv3:ralt_switch_multikey")))
 (host-name "guix-xps13")
 (users (cons* (user-account
                (name "aadcg")
                (comment "André Alexandre Gomes")
                (group "users")
                (home-directory "/home/aadcg")
                (supplementary-groups
                 '("wheel" "netdev" "audio" "video")))
               %base-user-accounts))
 (bootloader
  (bootloader-configuration
   (bootloader grub-efi-bootloader)
   (timeout 1)
   (target "/boot/efi")
   (keyboard-layout keyboard-layout)))
 (file-systems
  (cons* (file-system
          (mount-point "/boot/efi")
          (device (uuid "C820-AFF2" 'fat32))
          (type "vfat"))
         (file-system
          (mount-point "/")
          (device
           (uuid "76936a31-ce9b-4a50-a373-31db7a89ce41"
                 'ext4))
          (type "ext4"))
         %base-file-systems))
 (packages
  (append (map specification->package
               '("nss-certs"
                 "emacs-exwm"
                 "sway"
                 "guix-simplyblack-sddm-theme"
                 "tor"))
          %base-packages))
 (services
  (append
   (list
    (set-xorg-configuration
     (xorg-configuration
      (keyboard-layout keyboard-layout)
      (resolutions '((2560 1440)))
      (extra-config (list xorg-touchpad)))
     sddm-service-type)
    (service gnome-desktop-service-type
             (gnome-desktop-configuration
              (gnome gnome-minimal)))
    (service sddm-service-type
             (sddm-configuration
              (theme "guix-simplyblack-sddm")))
    ;; (info "(service unattended-upgrade-service-type)")
    ;; (service unattended-upgrade-service-type)
    (service openssh-service-type)
    (service tor-service-type)
    (service tlp-service-type))
   (remove (lambda (service)
	     (eq? (service-kind service) gdm-service-type))
           %desktop-services))))
