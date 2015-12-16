;; ~/emacs.d/init.el
(setq gc-cons-threshold (* 1024 1024 1024))

(setq user-full-name "Marek Fajksu"
      user-mail-address "marek.faj@gmail.com")

(add-hook
 'after-init-hook
 '(lambda ()

    "Basics"
    (load "~/.emacs.d/config/init-packages.el")
    (load "~/.emacs.d/config/init-utils.el")
    (load "~/.emacs.d/config/init-core.el")

    "Controlls"
    (load "~/.emacs.d/config/init-evil.el")
    (load "~/.emacs.d/config/init-helm.el")
    (load "~/.emacs.d/config/init-auto-complete.el")

    "Languages support"
    (load "~/.emacs.d/config/init-linting.el")
    (load "~/.emacs.d/config/init-javascript.el")

    "Glue"
    (load "~/.emacs.d/config/init-bindings.el")

    ;; Theme
    (custom-set-variables
     ;; custom-set-variables was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(custom-enabled-themes (quote (seti)))
     '(custom-safe-themes
       (quote
        ("94ba29363bfb7e06105f68d72b268f85981f7fba2ddef89331660033101eb5e5" default))))
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     )

    (nyan-mode)))
