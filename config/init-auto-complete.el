(require-package 'auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)

(use-package auto-complete
  :ensure t)

(use-package auto-complete-config
  :init
    (setq ac-auto-show-menu t)
    (setq ac-auto-start t)

    "settings"
    (setq ac-quick-help-delay 0.3)
    (setq ac-quick-help-height 30)
    (setq ac-show-menu-immediately-on-auto-complete t)

    "yasnipet integration"
    (after 'yasnippet
      (add-hook 'yas-before-expand-snippet-hook (lambda () (auto-complete-mode -1)))
      (add-hook 'yas-after-exit-snippet-hook (lambda () (auto-complete-mode t)))
      (defadvice ac-expand (before advice-for-ac-expand activate)
        (when (yas-expand)
          (ac-stop)))))

(require 'ac-etags)
(use-package ac-etags
  :ensure t
  :init
    (setq ac-etags-requires 1)
    (ac-config-default)
    (ac-etags-setup))

(provide 'auto-complete)
