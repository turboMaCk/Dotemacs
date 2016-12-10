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
(use-package editorconfig
  :ensure t
  :init
  (editorconfig-mode))

;; Flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

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
