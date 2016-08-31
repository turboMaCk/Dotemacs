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
;; (when (display-graphic-p (selected-frame))
;;   (eval-after-load 'flycheck
;;     '(custom-set-variables
;;       '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))

;; (add-hook 'js-mode-hook
;;           (lambda () (flycheck-mode t)))

;; Line ends
(defun dos-file-endings-p ()
  "Check if dos enconding is used."
  (string-match "dos" (symbol-name buffer-file-coding-system)))

(defun find-file-check-line-endings ()
  "Force UNIX line endings."
  (when (dos-file-endings-p)
    (set-buffer-file-coding-system 'undecided-unix)
    (set-buffer-modified-p nil)))

(add-hook 'find-file-hook 'find-file-check-line-endings)

(provide 'init-linting)
;;; init-linting.el ends here
