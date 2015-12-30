;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'use-package)

(use-package rbenv
  :ensure t
  :init (rbenv-use-corresponding))

(use-package yaml-mode
  :ensure t)

;;; init-ruby ends here
