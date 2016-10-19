;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'use-package)

(use-package rbenv
  :ensure t
  :init (rbenv-use-corresponding))

(use-package yaml-mode
  :ensure t)

(use-package projectile-rails
  :ensure t
  :init
  (progn
    (add-hook 'projectile-mode-hook 'projectile-rails-on)))

(provide 'init-ruby)
;;; init-ruby ends here
