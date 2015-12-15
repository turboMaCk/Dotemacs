;; ~/emacs.d/config/init-packages.el
(require 'cl)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Define packages
(defvar required-packages
  '(
    evil
    evil-leader
    evil-commentary
    helm
    helm-projectile
    neotree
    magit
    projectile
    key-chord
    seti-theme
    auto-complete
    etags
    ac-etags
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
