;;; Package --- Summary

;;; Commentary:
;; Main Emacs file responsible for loading all packages and configuration file.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)
;(set-default-font "Menlo")

;; (require 'cask "~/.cask/cask.el")
;; This works only for home brew versions!!!
(require 'cask "/home/marek/.cask/cask.el")
(cask-initialize)

;; Custom loads
(add-to-list 'load-path
   (expand-file-name "plugin"
                     user-emacs-directory))

(require 'pallet)
(pallet-mode t)

(require 'org)
(require 'org-install)
(require 'ob-tangle)

;; Load Config from Org file
(defun turbo_mack/load-config ()
  "Compile and load whole configuration."

  (org-babel-load-file
   (expand-file-name "turbo_mack.org"
                     user-emacs-directory)))

(turbo_mack/load-config)
(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(package-selected-packages
   (quote
    (cargo caml shm idris-mode bash-completion psc-ide psci purescript-mode helm-css-scss perspective which-key evil-org org-evil hindent robe multiple-cursors ob-restclient restclient nyan-mode)))
 '(purescript-mode-hook (quote (turn-on-purescript-indent)) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
