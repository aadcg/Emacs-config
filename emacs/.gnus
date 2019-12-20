(setq epa-file-cache-passphrase-for-symmetric-encryption t)

(setq user-mail-address "andremegafone@gmail.com"
      user-full-name "André Alexandre Gomes")

(setq gnus-select-method
      '(nnimap "posteo"
               (nnimap-address "posteo.de")  ; it could also be imap.googlemail.com if that's your server.
               (nnimap-server-port "imaps")
               (nnimap-stream ssl)))

(add-to-list 'gnus-secondary-select-methods '(nntp "news.gnus.org"))


(setq smtpmail-smtp-server "posteo.de"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(add-hook 'message-setup-hook 'mml-secure-message-encrypt)
(add-hook 'message-setup-hook 'mml-secure-message-sign)
;; (setq user-mail-address "andremegafone@gmail.com"
;;       user-full-name "André Alexandre Gomes")

;; (setq gnus-select-method
;;       '(nnimap "gmail"
;; 	       (nnimap-address "imap.gmail.com")  ; it could also be imap.googlemail.com if that's your server.
;; 	       (nnimap-server-port "imaps")
;; 	       (nnimap-stream ssl)))

;; (setq smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
