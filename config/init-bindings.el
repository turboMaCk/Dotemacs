(require 'evil)
(require 'evil-leader)
(require 'key-chord)
(require 'neotree)

;; Chord mode move to exit normal mode
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

;; Evil-Leader
(evil-leader/set-leader ",")
(evil-leader/set-key
  "m" 'helm-buffers-list
  "p" 'helm-find-files
  "x" 'helm-M-x
  "m" 'helm-buffer-list
  "r b" 'helm-bookmarks
  "y" 'helm-show-kill-ring
  "e" 'eval-last-sexp)

;; Window navigation
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-p") 'helm-find-files)

;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-x y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Neotree
(define-key evil-normal-state-map (kbd "C-e") 'neotree-toggle)
(add-hook 'neotree-mode-hook
    (lambda ()
	(define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	(define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	(define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)))

;; ESC to quit
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
