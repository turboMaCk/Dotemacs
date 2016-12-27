;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;;; Code:
(package-initialize)

(setq user-full-name "Marek Fajkus"
      user-mail-address "marek.faj@gmail.com")

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(add-hook
 'after-init-hook
 '(lambda ()

    "Basic Inits"
    (load "~/.emacs.d/config/init-packages.el")
    (load "~/.emacs.d/config/init-utils.el")
    (load "~/.emacs.d/config/init-osx.el")
    (load "~/.emacs.d/config/init-core.el")
    (load "~/.emacs.d/config/init-term.el")
    ;; (load "~/.emacs.d/config/init-modeline.el")
    (load "~/.emacs.d/config/init-theme.el")
    (load "~/.emacs.d/config/init-interface.el")
    (load "~/.emacs.d/config/init-linting.el")

    "Essentials"
    (load "~/.emacs.d/config/init-auto-complete.el")
    (load "~/.emacs.d/config/init-evil.el")
    (load "~/.emacs.d/config/init-helm.el")
    (load "~/.emacs.d/config/init-magit.el")
    (load "~/.emacs.d/config/init-org.el")
    (load "~/.emacs.d/config/init-yasnippet.el")

    "Languages support"
    (load "~/.emacs.d/config/init-web.el")
    (load "~/.emacs.d/config/init-javascript.el")
    (load "~/.emacs.d/config/init-typescript.el")
    (load "~/.emacs.d/config/init-elm.el")
    (load "~/.emacs.d/config/init-haskell.el")
    (load "~/.emacs.d/config/init-ruby.el")
    (load "~/.emacs.d/config/init-markdown.el")
    (load "~/.emacs.d/config/init-elixir")
    (load "~/.emacs.d/config/init-clojure")
    (load "~/.emacs.d/config/init-rust")
    (load "~/.emacs.d/config/init-erlang")

    "Glue"
    (load "~/.emacs.d/config/init-bindings.el")))
