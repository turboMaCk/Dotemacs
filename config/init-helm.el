(require 'helm-config)
(helm-mode 1)

(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(setq helm-projectile-fuzzy-match t)

(require 'helm-projectile)

;; Neotree integration
(defadvice helm-projectile-find-file (after helm-projectile-switch-project activate)
  (neotree-dir default-directory))
