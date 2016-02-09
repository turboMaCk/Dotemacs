;; ~/emacs.d/config/init-packages.el
(require 'cl)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Outside of packages system
(add-to-list 'load-path "~/elisp")

;; init
(package-initialize nil)

;; Define packages
(defvar required-packages
  '(
    use-package
    diminish
    multi-term
    evil
    evil-leader
    evil-commentary
    evil-magit
    key-chord
    helm
    helm-rails
    projectile
    helm-projectile
    ag
    helm-ag
    neotree
    magit
    seti-theme
    auto-complete
    etags
    ac-etags
    editorconfig
    web-mode
    ember-mode
    handlebars-mode
    autopair
    magit
    ) "a list of packages to ensure are installed at launch.")


;; Function to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;; If not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  "check for new packages (package versions)"
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
                                        ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(provide 'init-packages)
