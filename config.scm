(use-modules (gnu)
             (guix packages)
             (srfi srfi-1))
(use-service-modules desktop sddm networking ssh xorg pm nix)
(use-package-modules gnome xorg)

;; (man "xorg.conf(5)")
;; (man "xinput(1)")
(define xorg-touchpad
  "Section \"InputClass\"
  Identifier \"Touchpad\"
  Driver \"libinput\"
  MatchDevicePath \"/dev/input/event*\"
  MatchIsTouchpad \"on\"
  Option \"Tapping\" \"on\"
  Option \"Accel Speed\" \"0.7\"
EndSection

")

(define xorg-monitors
  "Section \"Device\"
  Identifier \"intel\"
  Option \"PreferCloneMode\" \"on\"
EndSection

Section \"Monitor\"
  Identifier \"eDP-1\"
  Option \"PreferredMode\" \"2560x1440\"
  Option \"DPMS\" \"off\"
EndSection

Section \"Monitor\"
  Identifier \"DP-1\"
  VendorName \"DELL\"
  ModelName \"U2515H\"
  Option \"DPMS\" \"off\"
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
             "gnome-keyring"
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
             "at-spi2-core"
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
               '("emacs-exwm"
                 "guix-simplyblack-sddm-theme"
                 "nss-certs"))
          %base-packages))

 (services
  (append
   (list
    (set-xorg-configuration
     (xorg-configuration
      (modules (list xf86-input-libinput
                     xf86-input-evdev))
      (keyboard-layout keyboard-layout)
      (extra-config (list xorg-touchpad
			  xorg-monitors)))
     sddm-service-type)
    (service gnome-desktop-service-type
             (gnome-desktop-configuration
              (gnome gnome-minimal)))
    (service sddm-service-type
             (sddm-configuration
              (theme "guix-simplyblack-sddm")))
    ;; (service openssh-service-type)
    (service tor-service-type)
    (service tlp-service-type))
   ;; (modify-services %desktop-services
   ;;     ;; (man "logind.conf(5)")
   ;;   (elogind-service-type
   ;;    c =>  (elogind-configuration
   ;;           ;; gives me enough time to dock the laptop before it goes to
   ;;           ;; sleep
   ;;           (inhibit-delay-max-seconds 10))))
   (remove (lambda (service)
	     (eq? (service-kind service) gdm-service-type))
           %desktop-services))))
