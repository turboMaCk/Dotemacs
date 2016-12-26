;;; Package --- Summary

;;; Commentary:
;; Main Emacs file responsible for loading all packages and configuration file.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)

;; (require 'cask "~/.cask/cask.el")
;; This works only for home brew versions!!!
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(require 'org)
(require 'org-install)
(require 'ob-tangle)

;; Load Config from Org file
(org-babel-load-file
 (expand-file-name "turbo_mack.org"
                   user-emacs-directory))

(provide 'init)
;;; init.el ends here
