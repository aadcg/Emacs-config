;;; minions-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "minions" "minions.el" (0 0 0 0))
;;; Generated autoloads from minions.el

(defvar minions-mode nil "\
Non-nil if Minions mode is enabled.
See the `minions-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `minions-mode'.")

(custom-autoload 'minions-mode "minions" nil)

(autoload 'minions-mode "minions" "\
Display a minor-mode menu in the mode line.

This replaces the likely incomplete and possibly cut off list of
minor-modes that is usually displayed directly in the mode line.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "minions" '("minions-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; minions-autoloads.el ends here
