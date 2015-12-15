;; ~/emacs.d/config/init-evil.el
(require 'evil)
(require 'evil-leader)
(require 'evil-commentary)

(evil-mode 1)
(global-evil-leader-mode)
(evil-commentary-mode)

(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

;; Custom commpad
(evil-ex-define-cmd "W[rite]" 'evil-wrie)
(evil-ex-define-cmd "Q[uit]" 'evil-quit)
