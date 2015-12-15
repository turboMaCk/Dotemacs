;; ~/emacs.d/init.el

(let ((debug-on-error t)
      (file-name-handler-alist nil)
      (config-directory (concat user-emacs-directory "config/"))))


(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/config/init-packages.el")
  (load "~/.emacs.d/config/init-utils.el")
  (load "~/.emacs.d/config/init-evil.el")
  (load "~/.emacs.d/config/init-helm.el")
  (load "~/.emacs.d/config/init-auto-complete.el")
  (load "~/.emacs.d/config/init-bindings.el")
  (load "~/.emacs.d/config/init-interface.el")
))
