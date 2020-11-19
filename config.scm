(use-modules (gnu)
             (srfi srfi-1))
(use-service-modules desktop sddm networking ssh xorg pm nix)

(operating-system
  (locale "en_US.utf8")
  (timezone "Europe/Moscow")
  ;; (timezone "Europe/Lisbon")
  (keyboard-layout
   (keyboard-layout
    "us,ru" "altgr-intl"
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
    (timeout 2)
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
     (service gnome-desktop-service-type)
     ;; (info "(guix) X Window")
     (service sddm-service-type
              (sddm-configuration
               ;; could I use the literate capabilities of org?
               ;; ‘xsession-command’ (default: ‘xinitrc’)
               ;; add your avatar at ~/.face.icon
               (theme "guix-simplyblack-sddm")))
     ;; (info "(service unattended-upgrade-service-type)")
     ;; (service unattended-upgrade-service-type)
     ;; (service docker-service-type)
     (service openssh-service-type)
     (service tor-service-type)
     (service tlp-service-type)
     (set-xorg-configuration
      (xorg-configuration
       (keyboard-layout keyboard-layout)
       (resolutions '((2560 1440))))
      sddm-service-type))
    (remove (lambda (service)
	      (eq? (service-kind service) gdm-service-type))
            %desktop-services))))
