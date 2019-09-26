;;; gitlab-ci-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "gitlab-ci-mode" "gitlab-ci-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from gitlab-ci-mode.el

(autoload 'gitlab-ci-mode "gitlab-ci-mode" "\
Major mode for editing GitLab CI (‘.gitlab-ci.yml’) files.

GitLab CI uses a YAML-based file format to configure the jobs it
will run in order to build, test, and deploy software.  For more
information about the GitLab CI file format, see URL
‘https://docs.gitlab.com/ce/ci/yaml/README.html’.  For general
information about GitLab CI, see URL
‘https://docs.gitlab.com/ce/ci/README.html’ and URL
‘https://about.gitlab.com/features/gitlab-ci-cd/’.

This mode is capable of linting files but does not do so
automatically out of security concerns. Use ‘gitlab-ci-lint’ to
lint interactively on-demand, or ‘gitlab-ci-request-lint’ to
integrate the linting process with other software.

Although this derives from ‘yaml-mode’, it does not truly parse
YAML.  Only idiomatic GitLab CI syntax will be handled correctly.
In particular, it does not expect to encounter tags.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.gitlab-ci.yml\\'" . gitlab-ci-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "gitlab-ci-mode" '("gitlab-ci-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; gitlab-ci-mode-autoloads.el ends here
