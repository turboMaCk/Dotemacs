;;; package --- Summary:
;;; Commentary:
;;; (require 'aggressive-indent)
;;; (global-aggressive-indent-mode 1)
;;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;;; Code:

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
(electric-pair-mode)

;; Remove trailing witespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Editor Config
(require-package 'editorconfig)
(editorconfig-mode)

;; Flycheck
(require-package 'flycheck)
(after 'flycheck
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled)
;;         flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)
;;         flycheck-checkers (delq 'html-tidy flycheck-checkers)
;;         flycheck-standard-error-navigation nil)
  (global-flycheck-mode))

;; flycheck errors on a tooltip (doesnt work on console)
(when (display-graphic-p (selected-frame))
  (eval-after-load 'flycheck
    '(custom-set-variables
      '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))

;; (add-hook 'js-mode-hook
;;           (lambda () (flycheck-mode t)))

(provide 'init-linting)
;;; init-linting.el ends here
