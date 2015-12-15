;; ~/emacs.d/init.el

(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/config/init-packages.el")
  (load "~/.emacs.d/config/init-utils.el")
  (load "~/.emacs.d/config/init-evil.el")
  (load "~/.emacs.d/config/init-helm.el")
  (load "~/.emacs.d/config/init-auto-complete.el")
  (load "~/.emacs.d/config/init-bindings.el")
  (load "~/.emacs.d/config/init-interface.el")
))
