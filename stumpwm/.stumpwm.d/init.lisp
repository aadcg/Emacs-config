(in-package :stumpwm)

(setq *startup-message* nil)
(setq *startup-mode-line* t)

(set-module-dir "~/.stumpwm.d/stumpwm-contrib")

;; Modeline Battery
(load-module "battery-portable")
(load-module "cpu")
(load-module "mem")

(setf *mode-line-position* :top
      *mode-line-timeout* 20
      ;; *mode-line-pad-x* 8
      ;; *mode-line-pad-y* 1
      *time-modeline-string* "%a %d %b %H:%M"
      ;; *window-border-style* :thin
      *window-border-style* 1
      *frame-number-map* "1234567890"
      *window-format* "%m%n%s%c"
      *cpu-modeline-fmt* "%C"
      *delim* " ^2::^7 "
      *screen-mode-line-format* (list
                                 ;; Windows
                                 ;;"[^B%n^b]"
                                 "^7%W ^>^7"
                                 ;; CPU
                                 "%C" *delim*
                                 ;; RAM
                                 "%M" *delim*
                                 ;; Battery
                                 "%B" *delim*
                                 ;; Date
                                 "%d"
                                 )
      )

;; launch Web browser
(defcommand firefox () ()
  "Start Firefox or switch to it, if it is already running."
  (run-or-raise "firefox" '(:class "Firefox")))
(define-key *root-map* (kbd "B") "firefox")

;; launch terminal
(defcommand urxvt () ()
  "Start Urxvt or switch to it, if it is already running."
  (run-or-raise "urxvt" '(:class "Urxvt")))
(define-key *root-map* (kbd "c") "urxvt")

;; Change xterm to urxvt
(define-key *root-map* (kbd "C") "exec urxvt")

;; Volume Management
(progn
  (define-key *top-map* (kbd "XF86AudioLowerVolume") "exec amixer -q sset Master 3%-")
  (define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec amixer -q sset Master 3%+")
  (define-key *top-map* (kbd "XF86AudioMute") "amixer -q sset Master toggle"))

;; Mode-line
(progn
  (enable-mode-line (current-screen) (current-head) t))
