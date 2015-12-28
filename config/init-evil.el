;; TODO: ex define Wq && WQ
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

;; optional: this is the evil state that evil-magit will use
;; (setq evil-magit-state 'motion)
;; optional: enable additional bindings for yanking text (evil-magit-state needs
;; to be 'normal for this to work properly)
;; (setq evil-use-y-for-yank t)
(use-package evil-magit
  :ensure t)
