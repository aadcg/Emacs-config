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
;; set font
;; (ql:quickload "clx-truetype")
;; (load-module "ttf-fonts")
;; (set-font (make-instance 'xft:font :family "DejaVu Sans Mono" :subfamily "Book" :size 11))
;; (set-font "Fira Code")


(setf *mode-line-timeout* 10
      *time-modeline-string* "%a %d %b %H:%M"
      *window-border-style* :thin
      *mode-line-background-color* "#3F3F3F"
      *mode-line-foreground-color* "#DCDCCC"
      *cpu-modeline-fmt* "%C"
      *delim* " ^2::^7 "
      *screen-mode-line-format* (list
                                 ;; Windows
                                 ;; "%v | "
                                 "^7%W ^>^7"
                                 ;; "[^B%n^b] %W ^>"
                                 ;; CPU
                                 ;; "%C" *delim*
                                 ;; RAM
                                 ;; "%M" *delim*
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


;; (setf swm-gaps:*inner-gaps-size* 12
;;       swm-gaps:*outer-gaps-size* 12
;;       swm-gaps:*head-gaps-size* 12
;;       swm-gaps:*gaps-on* t)

;; (setf *message-window-gravity* :center
;;       *input-window-gravity* :center
;;       *window-border-style* :thin
;;       *message-window-padding* 10
;;       *maxsize-border-width* 5
;;       *normal-border-width* 5
;;       *transient-border-width* 2
;;       stumpwm::*float-window-border* 2
;;       stumpwm::*float-window-title-height* 5
;;       *mouse-focus-policy* :click)

;; (set-normal-gravity :center)
;; (set-maxsize-gravity :center)
;; (set-transient-gravity :center)

;; (set-fg-color "#eeeeee")
;; (set-bg-color "#1C2028")
;; (set-border-color "#232731")
;; (set-focus-color "#3B4252")
;; (set-unfocus-color "#232731")
;; (set-win-bg-color "#22272F")
;; (set-float-focus-color "#3B4252")
;; (set-float-unfocus-color "#232731")

;; (setf *colors* (list "#1C2028"      ; 0 black
;;                      "#BF616A"      ; 1 red
;;                      "#A3BE8C"      ; 2 green
;;                      "#EBCB8B"      ; 3 yellow
;;                      "#5E81AC"      ; 4 blue
;;                      "#B48EAD"      ; 5 magenta
;;                      "#8FBCBB"      ; 6 cyan
;;                      "#ECEFF4"))    ; 7 white

;; ;(clx-truetype:cache-fonts)

;; (set-font (make-instance 'xft:font
;; 			 :family "Source Code Pro"
;; 			 :subfamily "Regular"
;; 			 :size 11))
