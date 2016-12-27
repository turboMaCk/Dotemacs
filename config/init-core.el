;;; package --- Summary
;;; Commentary:
;;; setup basic Emacs features

;;; Code:
(require 'use-package)

(require 'server)
(unless (server-running-p)
    (server-start))

;; Interface
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (display-graphic-p)
  (when (fboundp 'menu-bar-mode) (menu-bar-mode t))
  (when (fboundp 'menu-bar-mode) (menu-bar-mode -1)))

;; start scratch in text mode (usefull to get a faster Emacs load time
;; because it avoids autoloads of elisp modes)
(setq initial-major-mode 'text-mode)
(setq redisplay-dont-pause t)

;; Exec path
(setq exec-path (append exec-path '("Users/marek/.nvm/versions/node/v0.12.9/bin:/Users/marek/.rbenv/shims:/usr/local/sbin:/usr/local/bin")))

;; exec path
(use-package exec-path-from-shell
  :ensure t
  :init (when (memq window-system '(mac ns))
          (exec-path-from-shell-initialize)))

;; Line numbers && fringe
(add-hook 'prog-mode-hook 'linum-mode)

(when (display-graphic-p)
  (lambda()
    (fringe-mode 2)
    (setq-default left-fringe-width 12)
    (setq-default right-fringe-width 0)))
(setq-default truncate-lines t)
(setq line-spacing 2)

(use-package saveplace
  :init
  (setq-default save-place t))

(use-package smooth-scrolling
  :ensure t)

(use-package recentf
  :init
    (recentf-mode t)
    (setq recentf-save-file "~/.emacs.d/recentf")
    (setq recentf-max-saved-items 1000)
    (setq recentf-max-menu-items 500)
    (setq recentf-auto-cleanup 300)
    (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")
    (run-with-timer 1800 1800 'recentf-save-list))

;; Garbage collection
(run-with-idle-timer (* 60 3) t #'garbage-collect)

;; pcomplete
(setq-default pcomplete-ignore-case t)

;; imenu
(setq-default imenu-auto-rescan t)

;; narrowing
(put 'narrow-to-region 'disabled nil)

;; dired
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

;; compile
(setq-default compilation-always-kill t)
(setq compilation-ask-about-save nil)
(add-hook 'compilation-filter-hook
	  (lambda ()
	    (when (eq major-mode 'compilation-mode)
	      (require 'ansi-color)
	      (let ((inhibit-read-only t))
		(ansi-color-applu-on-region (point-min) (point-max))))))

;; Bookamrks
(setq-default bookmark-default-file "~/.emacs.d/bookmakrs")
(setq-default bookmark-save-flag 1)

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; History
(setq-default savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq-default savehist-save-minibuffer-history 1)
(setq-default savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; Edif
(setq-default ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)

;; re-builder
(setq-default reb-re-syntax 'string) ;; fix backslash madness

;; Winner mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Clean up old buffers periodically
(require 'midnight)
(midnight-delay-set 'midnight-delay 0)

;; ibuffer
(setq-default ibuffer-expert t)
(setq-default ibuffer-show-empty-filter-groups nil)
(add-hook 'ibuffer-mode-hook #'ibuffer-auto-mode)

;; better scrolling
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t
      scroll-margin 3)

;; better buffer names for duplicates
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-ignore-buffers-re "^\\*" ; leave special buffers alone
      uniquify-after-kill-buffer-p t)

(defun my-do-not-kill-scratch-buffer ()
    "PREVENT KILLING SCRATCH BUFFERS!"
    (if (member (buffer-name (current-buffer))
                '("*scratch*" "*Messages*" "*Require Times*"))
      (progn
        (bury-buffer)
        nil)
    t))
(add-hook 'kill-buffer-query-functions 'my-do-not-kill-scratch-buffer)

;; Short answers
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 FTW
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; USEFULL (for not going mad)
(setq ring-bell-function 'ignore)
(setq sentence-end-double-space nil)
(setq delete-by-moving-to-trash t)
(setq mark-ring-max 64)
(setq global-mark-ring-max 128)
(setq save-interprogram-paste-before-kill t)
(setq create-lockfiles nil)
(setq echo-keystrokes 0.01)
(setq initial-major-mode 'emacs-lisp-mode)
(setq eval-expression-print-level nil)
(setq-default indent-tabs-mode nil)

(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

(xterm-mouse-mode t)
(which-function-mode t)
(blink-cursor-mode -1)
(global-auto-revert-mode t)
(electric-indent-mode t)
(transient-mark-mode t)
(delete-selection-mode t)
(random t) ;; seed

(provide 'init-core)
;;; init-core.el ends here
