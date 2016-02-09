;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'use-package)

(use-package rbenv
  :ensure t
  :init (rbenv-use-corresponding))

(use-package yaml-mode
  :ensure t)

(provide 'init-ruby)
;;; init-ruby ends here
