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
    (load "~/.emacs.d/config/init-term.el")
    (load "~/.emacs.d/config/init-modeline.el")
    (load "~/.emacs.d/config/init-yasnippet.el")

    "Controlls"
    (load "~/.emacs.d/config/init-evil.el")
    (load "~/.emacs.d/config/init-helm.el")
    (load "~/.emacs.d/config/init-auto-complete.el")

    "Languages support"
    (load "~/.emacs.d/config/init-linting.el")
    (load "~/.emacs.d/config/init-javascript.el")
    (load "~/.emacs.d/config/init-ruby.el")
    (load "~/.emacs.d/config/init-markdown.el")

    "Glue"
    (load "~/.emacs.d/config/init-bindings.el")

    (nyan-mode t)))

;;; init.el ends here
