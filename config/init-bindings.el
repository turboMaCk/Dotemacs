;; Evil
(require 'evil)

;; Window navigation
(define-key evil-motion-state-map (kbd "C-h") 'windmove-left)
(define-key evil-motion-state-map (kbd "C-j") 'windmove-down)
(define-key evil-motion-state-map (kbd "C-k") 'windmove-up)
(define-key evil-motion-state-map (kbd "C-l") 'windmove-right)

;; Winner mode
(define-key evil-normal-state-map (kbd "C-c l") 'winner-redo)
(define-key evil-normal-state-map (kbd "C-c h") 'winner-undo)

;; ESC to quit
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(require 'key-chord)
;; Chord mode move to exit normal mode
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

;; Helm
(require 'helm)
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-x y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(define-key helm-map (kbd "C-j") 'helm-select-next)

;; Helm projectile
(require 'helm-projectile)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
(define-key evil-motion-state-map (kbd "C-M-p") 'helm-projectile-switch-project)
(define-key evil-normal-state-map (kbd "C-a") 'helm-projectile-ag)


;; Evil-Leader
(require 'evil-leader)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "a" 'helm-ag
  "t" 'multi-term
  "l" 'multi-term-next
  "h" 'multi-term-prev
  "p" 'helm-find-files
  "x" 'helm-M-x
  "m" 'helm-buffer-list
  "r b" 'helm-bookmarks
  "y" 'helm-show-kill-ring
  "e" 'eval-last-sexp)

(require 'auto-complete)

;; Autocomplete
(define-key ac-mode-map (kbd "C-j") 'ac-next)
(define-key ac-mode-map (kbd "C-k") 'ac-previous)

;; Neotree
(require 'neotree)
(define-key evil-normal-state-map (kbd "C-e") 'neotree-toggle)
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-motion-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-motion-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-motion-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-motion-state-local-map (kbd "C-h") 'neotree-hidden-file-toggle)
            (define-key evil-motion-state-local-map (kbd "v") (neotree-make-executor
                                                               :file-fn 'neo-open-file-vertical-split))
            (define-key evil-motion-state-local-map (kbd "i") (neotree-make-executor
                                                               :file-fn 'neo-open-file-horizontal-split))
            "neotree bindings"))
