;;; package --- Summary
;;; Commentary:
;; TODO: ex define Wq && WQ
;;; Code:
(require 'use-package)
(use-package evil
  :ensure t
  :init
  (progn
    (evil-mode 1)
    (setq evil-search-module 'evil-search)
    (setq evil-magic 'very-magic))
  :config
  (progn

    "Custom commands"
    (evil-ex-define-cmd "W[rite]" 'evil-write)
    (evil-ex-define-cmd "Q[uit]" 'evil-quit)
    (evil-ex-define-cmd "Wq[rite]" 'evil-write)))

(use-package evil-commentary
  :ensure t
  :init (evil-commentary-mode t))

(use-package evil-leader
  :ensure t
  :init (global-evil-leader-mode))

(use-package evil-surround
  :ensure t
  :init (global-evil-surround-mode))

(use-package evil-visualstar
  :ensure t
  :init (global-evil-visualstar-mode t))

;; Tmux!!
(use-package navigate
  :ensure t)

;; Cursor colors based on mode
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(provide 'init-evil)
;;; init-evil.el ends here
