;;; package --- Summary:
;;; Commentary:
;;; (require 'aggressive-indent)
;;; (global-aggressive-indent-mode 1)
;;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;;; Code:
(require 'use-package)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
(electric-pair-mode)

(use-package editorconfig
  :ensure t
  :init (editorconfig-mode))

;; Remove trailing witespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; (use-package flymake-easy
;;   :init (setq flymake-log-level 3))

;; (use-package flymake-jshint
;;   :ensure t
;;   :init ())

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(provide 'init-linting)

(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))

(provide 'init-linting)
;;; init-linting.el ends here
