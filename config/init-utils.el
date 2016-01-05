;;; package --- Summary
;;; Commentary:

;;; Code:
;;; Mini buffer cloasing
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

;;; init-utils.el ends here
