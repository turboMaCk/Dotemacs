;;; package --- Summary
;;; Commentary:

;;; Code:
;;; Mini buffer cloasing
(if (fboundp 'with-eval-after-load)
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(with-eval-after-load ,feature ,@body))
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
                      '(progn ,@body))))

(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."

  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(defun my/vsplit-and-skip()
  "split verticaly and skip to new window"

  (interactive)
  (evil-window-vsplit)
  (windmove-right))

(defun my/split-and-skip()
  "split horizontaly and skip to new window"

  (interactive)
  (evil-window-split)
  (windmove-down))

(defun my/neotree-open()
  "set neotree root dir and toggle neotree state"

  (interactive)
  (neotree-dir default-directory))

(defun my/neotree-hide()
  "hide neotree and skip to window on left"

  (interactive)
  (neotree-hide)
  (evil-window-move-far-left))

(defun my/toggle-term()
  (interactive)
  (split-window-below)
  (windmove-down)
  (term "/bin/zsh"))

(defun my/rotate-windows-helper(x d)
  (if (equal (cdr x) nil) (set-window-buffer (car x) d)
    (set-window-buffer (car x) (window-buffer (cadr x))) (my/rotate-windows-helper (cdr x) d)))

(defun my/rotate-windows ()
  "Rotate Emacs windows."
  (interactive)
  (my/rotate-windows-helper (window-list) (window-buffer (car (window-list))))
  (select-window (car (last (window-list)))))

(provide 'init-utils)
;;; init-utils.el ends here
