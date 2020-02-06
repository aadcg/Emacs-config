(setq epa-file-cache-passphrase-for-symmetric-encryption t)

(setq user-mail-address "andremegafone@gmail.com"
      user-full-name "André Alexandre Gomes")

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port "imaps")
               (nnimap-stream ssl))
      nnir-imap-default-search-key "Imap")

(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 25
      send-mail-function 'smtpmail-send-it
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(add-hook 'message-setup-hook 'mml-secure-message-encrypt)
(add-hook 'message-setup-hook 'mml-secure-message-sign)
