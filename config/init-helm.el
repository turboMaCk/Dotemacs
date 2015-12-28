;;; package --- Summary:
;;; Commentary:
;;; Code:
(require 'use-package)
(use-package helm
  :ensure t
  :init (require 'helm-config)
  :config
  (helm-mode 1))

(require 'projectile)
(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching -1))

;; TODO: fix neotree integration
(use-package helm-projectile
  :ensure t
  :init (setq helm-projectile-fuzzy-match t)
  :config
  (defadvice helm-projectile-find-file (after helm-projectile-switch-project activate)
    (neotree-dir default-directory)))

(provide 'init-helm)
;;; init-helm.el ends here
