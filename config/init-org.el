(use-package ox-reveal
  :ensure t)

(require 'ox)
(require 'ob)

(use-package ob-typescript
  :ensure t)

(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode)))

;; add default arguments to use when evaluating a source block

(org-babel-do-load-languages
    'org-babel-load-languages
    '((sh . t)
      (ruby . t)
      (js . t)
      (typescript . t)
      (elm . t)
      (C . t)
      (haskell . t)))

(setq org-confirm-babel-evaluate nil)

(defun babel-confirm (flag)
  "Report the setting of org-confirm-babel-evaluate.
If invoked with C-u, toggle the setting"
  (interactive "P")
  (if (equal flag '(4))
      (setq org-confirm-babel-evaluate (not org-confirm-babel-evaluate)))
  (message "Babel evaluation confirmation is %s"
           (if org-confirm-babel-evaluate "on" "off")))

(provide 'init-org)
;;; init-org.el ends here
