;; ~/emacs.d/config/init-evil.el
(require 'evil)
(evil-mode 1)
(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

;; Custom commpad
(evil-ex-define-cmd "W[rite]" 'evil-write)
(evil-ex-define-cmd "Q[uit]" 'evil-quit)

(require 'evil-commentary)
(evil-commentary-mode t)

(require 'evil-leader)
(global-evil-leader-mode)

;; optional: this is the evil state that evil-magit will use
;; (setq evil-magit-state 'motion)
;; optional: enable additional bindings for yanking text (evil-magit-state needs
;; to be 'normal for this to work properly)
;; (setq evil-use-y-for-yank t)
(require 'evil-magit)
