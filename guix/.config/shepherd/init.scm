(load "services.scm")

(register-services emacs)
(action 'shepherd 'daemonize) ; send shepherd into background
(for-each start (list emacs))
