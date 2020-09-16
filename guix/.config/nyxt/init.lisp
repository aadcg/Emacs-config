(defvar *my-keymap* (make-keymap "my-map"))
(define-key *my-keymap*
  "C-j" 'nyxt/web-mode:follow-hint
  ;; "" 'nyxt/web-mode:unzoom-page
  )

(define-mode my-mode ()
  "Dummy mode for the custom key bindings in `*my-keymap*'."
  ((keymap-scheme :initform (keymap:make-scheme
                             scheme:emacs *my-keymap*))))

(define-configuration buffer
  ((default-modes (append '(emacs-mode my-mode) %slot-default))
   (current-zoom-ratio 2)
   (zoom-ratio-default 2)
   ))

(define-configuration minibuffer
  ((max-lines 6)
   (minibuffer-style (cl-css:css
                      '((* :font-family "monospace,monospace" :font-size "24px" :line-height "28px")
                        (nyxt::body :border-top "4px solid dimgray" :margin "0" :padding "0 6px")
                        ("#container" :display "flex" :flex-flow "column" :height "100%")
                        ("#input" :padding "6px 0" :border-bottom "solid 1px lightgray")
                        ("#suggestions" :flex-grow "1" :overflow-y "auto" :overflow-x "auto")
                        ("#cursor" :background-color "gray" :color "white")
                        ("#prompt" :padding-right "4px" :color "dimgray")
                        (nyxt::ul :list-style "none" :padding "0" :margin "0")
                        (nyxt::li :padding "2px")
                        (nyxt::.marked :background-color "darkgray" :font-weight "bold" :color
                                       "white")
                        (nyxt::.selected :background-color "gray" :color "white"))))))

(define-configuration window
  ((message-buffer-height 24)
   (message-buffer-style (cl-css:css
                          '((body
                             :font-size "24x"
                             :padding 0
                             :padding-left "4px"
                             :margin 0))))))
