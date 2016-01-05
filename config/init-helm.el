;;; package --- Summary:
;;; Commentary:
;;; Code:
(require 'use-package)
(use-package helm
  :ensure t
  :init
  (require 'helm-config)
  (helm-mode 1)
  (helm-autoresize-mode 1))

(require 'projectile)
(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching -1))

;; TODO: fix neotree integration
(use-package helm-projectile
  :ensure t
  :init (setq helm-projectile-fuzzy-match t))

(provide 'init-helm)
;;; init-helm.el ends here
