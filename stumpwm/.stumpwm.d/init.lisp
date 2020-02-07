(in-package :stumpwm)

(setq *startup-message* nil)
(setq *startup-mode-line* t)

;; Modeline
;; Setting up and loading extra modules
(set-module-dir "~/.stumpwm.d/stumpwm-contrib")
(mapcar #'load-module
           '("battery-portable"
             "cpu"
             "mem"
             ;; "amixer"
             ))

(setf *colors* (list "#1C2028"      ; 0 black
                     "#CC9393"      ; 1 red
                     "#7F9F7F"      ; 2 green
                     "#F0DFAF"      ; 3 yellow
                     "#8CD0D3"      ; 4 blue
                     "#DC8CC3"      ; 5 magenta
                     "#93E0E3"      ; 6 cyan
                     "#ECEFF4"))    ; 7 white

(setf *mode-line-timeout* 1
      *time-modeline-string* "%a %d %b %k:%M"
      *mode-line-background-color* "#3F3F3F"
      *mode-line-foreground-color* "#DCDCCC"
      *normal-border-width* 0
      *mode-line-border-width* 0
      *window-border-style* :thin
      *mouse-focus-policy* :click
      *window-name-source* :class
      *delim* " ^6|^7 "
      *screen-mode-line-format* (list
                                 ;; Windows
                                 "%W ^>"
                                 ;; CPU
                                 "%C" *delim*
                                 ;; RAM
                                 "%M" *delim*
                                 ;; Battery
                                 "%B" *delim*
                                 ;; Date (msk and pt)
                                 "%d" *delim*
                                 '(:eval (stumpwm:run-shell-command
                                          "TZ='Europe/Lisbon' date +%k:%M" t))
                                 ))

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

;; Volume Management
(progn
  (define-key *top-map* (kbd "XF86AudioLowerVolume") "exec amixer -q sset Master 3%-")
  (define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec amixer -q sset Master 3%+")
  (define-key *top-map* (kbd "XF86AudioMute") "exec amixer -q sset Master toggle"))

(progn
  (enable-mode-line (current-screen) (current-head) t))

;; Show / Hide mode-line
(define-key *root-map* (kbd "M") "mode-line")
