;;; sensible-defaults.el --- Reasonable settings for getting started.

;; Author: Harry R. Schwartz <hello@harryrschwartz.com>
;; Version: 1.0.0
;; URL: https://github.com/hrs/sensible-defaults.el/sensible-defaults.el

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(defun sensible-defaults/reset-text-size ()
  (interactive)
  (text-scale-set 0))

(defun sensible-defaults/open-files-from-home-directory ()
  "When opening a file, start searching at the user's home
directory."
  (setq default-directory "~/"))

(defun sensible-defaults/increase-gc-threshold ()
  "Allow 20MB of memory (instead of 0.76MB) before calling
garbage collection. This means GC runs less often, which speeds
up some operations."
  (setq gc-cons-threshold 20000000))

(defun sensible-defaults/delete-trailing-whitespace ()
  "Call DELETE-TRAILING-WHITESPACE every time a buffer is saved."
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defun sensible-defaults/treat-camelcase-as-separate-words ()
  "Treat CamelCaseSubWords as separate words in every programming
mode."
  (add-hook 'prog-mode-hook 'subword-mode))

(defun sensible-defaults/automatically-follow-symlinks ()
  "When opening a file, always follow symlinks."
  (setq vc-follow-symlinks t))

(defun sensible-defaults/make-scripts-executable ()
  "When saving a file that starts with `#!', make it executable."
  (add-hook 'after-save-hook
            'executable-make-buffer-file-executable-if-script-p))

(defun sensible-defaults/single-space-after-periods ()
  "Don't assume that sentences should have two spaces after
periods. This ain't a typewriter."
  (setq sentence-end-double-space nil))

(defun sensible-defaults/offer-to-create-parent-directories-on-save ()
  "When saving a file in a directory that doesn't exist, offer
to (recursively) create the file's parent directories."
  (add-hook 'before-save-hook
            (lambda ()
              (when buffer-file-name
                (let ((dir (file-name-directory buffer-file-name)))
                  (when (and (not (file-exists-p dir))
                             (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                    (make-directory dir t)))))))

(defun sensible-defaults/overwrite-selected-text ()
  "If some text is selected, and you type some text, delete the
selected text and start inserting your typed text."
  (delete-selection-mode t))

(defun sensible-defaults/ensure-that-files-end-with-newline ()
  "If you save a file that doesn't end with a newline,
automatically append one."
  (setq require-final-newline t))

(defun sensible-defaults/less ()
  "Aesthetics"
  (setq inhibit-startup-message t)
  (setq initial-scratch-message nil)
  (tool-bar-mode -1)
  ;; (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (horizontal-scroll-bar-mode -1)
  (fset 'yes-or-no-p 'y-or-n-p)
  (show-paren-mode t)
  (setq show-paren-delay 0.0)
  ;; line number on texty stuff
  (add-hook 'prog-mode-hook 'linum-mode)
  (add-hook 'text-mode-hook 'linum-mode))

(defun sensible-defaults/make-dired-file-sizes-human-readable ()
  "Add file sizes in human-readable units (KB, MB, etc) to dired
buffers."
  (setq-default dired-listing-switches "-Alh"))

(defun sensible-defaults/refresh-buffers-when-files-change ()
  "When something changes a file, automatically refresh the
buffer containing that file so they can't get out of sync."
  (global-auto-revert-mode t))

(defun sensible-defaults/set-default-line-length-to (line-length)
  "Set the default line length to LINE-LENGTH."
  (setq-default fill-column line-length))

(defun sensible-defaults/preserve-cursor ()
  "Keeps the cursor position after C-v and M-v"
  (setq scroll-preserve-screen-position 'always))

(defun sensible-defaults/kill-buffer-and-window ()
  "Killing a buffer also kills the associated window"
  (substitute-key-definition 'kill-buffer 'kill-buffer-and-window global-map))

(defun sensible-defaults/save-place ()
  "Save place in files between Sessions"
  (save-place-mode 1))

(defun sensible-defaults/use-all-settings ()
  "Use all of the sensible-defaults settings."
  (sensible-defaults/open-files-from-home-directory)
  (sensible-defaults/increase-gc-threshold)
  (sensible-defaults/delete-trailing-whitespace)
  (sensible-defaults/treat-camelcase-as-separate-words)
  (sensible-defaults/automatically-follow-symlinks)
  (sensible-defaults/make-scripts-executable)
  (sensible-defaults/single-space-after-periods)
  (sensible-defaults/offer-to-create-parent-directories-on-save)
  (sensible-defaults/overwrite-selected-text)
  (sensible-defaults/ensure-that-files-end-with-newline)
  (sensible-defaults/make-dired-file-sizes-human-readable)
  (sensible-defaults/refresh-buffers-when-files-change)
  (sensible-defaults/set-default-line-length-to 80)
  (sensible-defaults/less)
  (sensible-defaults/preserve-cursor)
  (sensible-defaults/kill-buffer-and-window)
  (sensible-defaults/save-place))

;; Keybindings:

(defun sensible-defaults/navigate-windows ()
  "Navigate windows with S-arrows"
  (windmove-default-keybindings)
  (setq windmove-wrap-around t))

(defun sensible-defaults/bind-keys-to-change-text-size ()
  "Bind C-+ and C-- to increase and decrease text size,
respectively."
  (define-key global-map (kbd "C-0") 'sensible-defaults/reset-text-size)
  (define-key global-map (kbd "C-+") 'text-scale-increase)
  (define-key global-map (kbd "C--") 'text-scale-decrease))

(defun sensible-defaults/regex-default ()
  "Permutate the behaviour of C-s / C-r with C-M-s C-M-r"
  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward))

(defun sensible-defaults/ibuffer ()
  "Use ibuffer by default"
  (global-set-key (kbd "C-x C-b") 'ibuffer))

(defun sensible-defaults/use-all-keybindings ()
  "Use all of the sensible-defaults keybindings."
  (sensible-defaults/navigate-windows)
  (sensible-defaults/bind-keys-to-change-text-size)
  (sensible-defaults/regex-default)
  (sensible-defaults/ibuffer))

;; Non-default settings:

(defun sensible-defaults/backup-to-temp-directory ()
  "Store backups and auto-saved files in
TEMPORARY-FILE-DIRECTORY (which defaults to /tmp on Unix),
instead of in the same directory as the file. This means we're
still making backups, but not where they'll get in the way.

WARNING: on most Unix-like systems /tmp is volatile, in-memory
storage, so your backups won't survive if your computer crashes!
If you're not willing to take this risk, you shouldn't enable
this setting."
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t))))

;;; sensible-defaults.el ends here
