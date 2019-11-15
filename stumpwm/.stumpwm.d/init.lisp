(in-package :stumpwm)

(setq *startup-message* nil)
(setq *startup-mode-line* t)

;; Modeline
;; Setting up and loading extra modules
(set-module-dir "~/.stumpwm.d/stumpwm-contrib")
(load-module "battery-portable")
(load-module "cpu")
(load-module "mem")

(setf *mode-line-timeout* 10
      *time-modeline-string* "%a %d %b %H:%M"
      *cpu-modeline-fmt* "%C"
      *delim* " ^2::^7 "
      *screen-mode-line-format* (list
                                 ;; Windows
                                 ;; "%v | "
                                 "^7%W ^>^7"
                                 ;; CPU
                                 "%C" *delim*
                                 ;; RAM
                                 "%M" *delim*
                                 ;; Battery
                                 ;; '(:eval (stumpwm:run-shell-command "cat /sys/class/power_supply/BAT0/capacity | tr -d '\n'" t))
                                 "%B" *delim*
                                 ;; Date
                                 "%d"
                                 )
      )

;; Keybindings
(set-prefix-key (kbd "C-i"))

;; Web Browser
(defcommand gui-browser () ()
  "Start Icecat (Firefox otherwise) or switch to it, if it is already running."
  (run-or-raise "icecat || firefox" '(:instance "Navigator")))

(define-key *root-map* (kbd "w") "gui-browser")

;; Terminal
(defcommand xterm () ()
  "Start Xterm or switch to it, if it is already running."
  (run-or-raise "xterm" '(:instance "xterm")))

(define-key *root-map* (kbd "c") "xterm")

;; Telegram
(defcommand telegram () ()
  "Start Telegram or switch to it, if it is already running."
  (run-or-raise "telegram-desktop" '(:instance "telegram-desktop")))

(define-key *root-map* (kbd "t") "telegram")

;; Volume Management
;; (progn
;;   (define-key *top-map* (kbd "XF86AudioLowerVolume") "exec amixer -q sset Master 3%-")
;;   (define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec amixer -q sset Master 3%+")
;;   (define-key *top-map* (kbd "XF86AudioMute") "amixer -q sset Master toggle"))

(progn
  (enable-mode-line (current-screen) (current-head) t))
