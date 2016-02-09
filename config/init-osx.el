(require 'use-package)

;; System clipboard (OSX specific)
(use-package osx-clipboard
  :ensure t
  :init (osx-clipboard-mode +1))

(provide 'init-osx)
