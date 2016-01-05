;;; package --- Summary
;;; Commentary:
;;; Setup EVIL MODE and related packages

;;; Code:
(require 'use-package)
(use-package evil
  :ensure t
  :config
  (progn

    "Window navigation"
    (define-key evil-motion-state-map (kbd "C-h") 'windmove-left)
    (define-key evil-motion-state-map (kbd "C-j") 'windmove-down)
    (define-key evil-motion-state-map (kbd "C-k") 'windmove-up)
    (define-key evil-motion-state-map (kbd "C-l") 'windmove-right)

    "Window spliting"
    (define-key evil-window-map (kbd "v") 'my/vsplit-and-skip)
    (define-key evil-window-map (kbd "s") 'my/split-and-skip)

    "Winner mode"
    (define-key evil-normal-state-map (kbd "C-c l") 'winner-redo)
    (define-key evil-normal-state-map (kbd "C-c h") 'winner-undo)

    "ESC to quit"
    (define-key evil-normal-state-map [escape] 'keyboard-quit)
    (define-key evil-visual-state-map [escape] 'keyboard-quit)
    (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)))

(use-package key-chord
  :ensure t
  :config
  (progn

    "Chord mode move to exit normal mode"
    (key-chord-mode 1)
    (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
    (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)))

;; Helm
(use-package helm
  :ensure t
  :config
  (progn

    "Super important helm bindings (vi like)"
    (define-key helm-map (kbd "C-j") 'helm-next-line)
    (define-key helm-map (kbd "C-k") 'helm-previous-line)

    "Force emacs to use helm"
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x b") 'helm-buffers-list)
    (global-set-key (kbd "C-x r b") 'helm-bookmarks)
    (global-set-key (kbd "C-x y") 'helm-show-kill-ring)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)))

(use-package helm-ag
  :ensure t)

;; Helm projectile
(use-package helm-projectile
  :ensure t
  :init
  (progn

    "Helm-projectile bindings (evil-normal)"
    (define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-find-file)
    (define-key evil-motion-state-map (kbd "C-M-p") 'helm-projectile-switch-project)
    (define-key evil-normal-state-map (kbd "C-a") 'helm-ag)))

;; Evil-Leader
(use-package evil-leader
  :ensure t
  :init
  (progn

    "Map leader to ,"
    (evil-leader/set-leader ",")

    "map leader keys"
    (evil-leader/set-key
        "a" 'helm-ag
        "t" 'my/toggle-term
        "l" 'multi-term-next
        "h" 'multi-term-prev
        "p" 'helm-find-files
        "x" 'helm-M-x
        "m" 'helm-buffer-list
        "r b" 'helm-bookmarks
        "y" 'helm-show-kill-ring
        "m" 'helm-buffers-list
        "e" 'eval-last-sexp)))

;; autocomplete
;; TODO: C-k insert mode issue
(use-package auto-complete
  :ensure t
  :config
  (progn

    "Vi like navigation"
    (define-key ac-mode-map (kbd "C-j") 'ac-next)
    (define-key ac-mode-map (kbd "C-k") 'ac-previous)))

;; Neotree
(use-package neotree
  :ensure t
  :init
  (progn
    "C-e to toggle neotree"
    (define-key evil-normal-state-map (kbd "C-e") 'my/neotree-open)

    "neotree keys"
    (add-hook 'neotree-mode-hook
        (lambda ()
            (define-key evil-motion-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-motion-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-motion-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-motion-state-local-map (kbd "C-h") 'neotree-hidden-file-toggle)
            (define-key evil-motion-state-local-map (kbd "C-l") 'my/neotree-hide)
            (define-key evil-motion-state-local-map (kbd "v") (neotree-make-executor
                                                                :file-fn 'neo-open-file-vertical-split))
            (define-key evil-motion-state-local-map (kbd "s") (neotree-make-executor
                                                                :file-fn 'neo-open-file-horizontal-split))
            'append))))

(provide 'init-bindings)
;;; init-bindings.el ends here
