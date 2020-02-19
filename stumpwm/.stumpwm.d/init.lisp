(in-package :stumpwm)

(setq *startup-message* nil)
(setq *startup-mode-line* t)

;; Modeline
;; Setting up and loading extra modules
(set-module-dir "~/.stumpwm.d/stumpwm-contrib")
(mapcar #'load-module
           '("battery-portable"
             "cpu"
             "mem"))

(setf *mode-line-background-color* "#3F3F3F"
      *mode-line-foreground-color* "#DCDCCC"
      *mode-line-border-width* 0
      *window-border-style* :thin
      *mouse-focus-policy* :click
      *window-name-source* :class
      *time-modeline-string* "%a %d %b %k:%M"
      *screen-mode-line-format* "%W ^> %C | %M | %B | %d")

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
;; (defcommand telegram () ()
;;   "Start Telegram or switch to it, if it is already running."
;;   (run-or-raise "telegram-desktop" '(:instance "telegram-desktop")))

;; (define-key *root-map* (kbd "t") "telegram")

;; Show / Hide mode-line
(define-key *root-map* (kbd "M") "mode-line")

;; Volume and Brightness Management
(progn
  (define-key *top-map* (kbd "XF86AudioLowerVolume")
    "exec amixer -q sset Master 3%-")
  (define-key *top-map* (kbd "XF86AudioRaiseVolume")
    "exec amixer -q sset Master 3%+")
  (define-key *top-map* (kbd "XF86AudioMute")
    "exec amixer -q sset Master toggle")
  (define-key *top-map* (kbd "XF86MonBrightnessUp")
    "exec brightnessctl set +100")
  (define-key *top-map* (kbd "XF86MonBrightnessDown")
    "exec brightnessctl set 100-"))

(progn
  (enable-mode-line (current-screen) (current-head) t))

(run-shell-command "nitrogen --restore")
(run-shell-command "emacs")
(run-shell-command "owncloud")
