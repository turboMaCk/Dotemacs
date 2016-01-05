(require 'nyan-mode)

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat " .../" output)))
    output))

(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
    (lambda ()
      (let ((color (cond ((minibufferp) default-color)
                         ((evil-insert-state-p) '("#eab700" . "#ffffff"))
                         ((evil-emacs-state-p)  '("#af00d7" . "#ffffff"))
                         ((buffer-modified-p)   '("#5EBDF9" . "#ffffff"))
                         (t default-color))))
        ;(set-face-background 'mode-line-filename-face (car color))
        (set-face-background 'mode-line-state-face (car color))
        (set-face-foreground 'mode-line-filename-face (car color))))))

;; Mode line setup
(setq-default
 mode-line-format
 '(; Position, including warning for 80 columns
   (:propertize "" face mode-line-base-face)
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize " READ " 'face 'mode-line-read-only-face))
          ((evil-insert-state-p)
           (propertize " INSERT " 'face 'mode-line-state-face))
          ((evil-visual-state-p)
           (propertize " VISUAL " 'face 'mode-line-state-face))
          (t (propertize " NORMAL " 'face 'mode-line-state-face))))
   ; directory and buffer/file name
   (:propertize
     (:eval (shorten-directory default-directory 10))
                face mode-line-folder-face)
   (:propertize "%b "
                face mode-line-filename-face)
   ; narrow [default -- keep?]
   " "
   ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
   (vc-mode vc-mode)
   " "
   ; nyan-mode uses nyan cat as an alternative to %p
   (:eval (when nyan-mode (list (nyan-create))))
   (:propertize "%[ "
                face mode-line-mode-face)
   (:propertize mode-name
                face mode-line-mode-face)
   (:propertize "%] "
                face mode-line-mode-face)
   ))

;; Extra mode line faces
(make-face 'mode-line-base-face)
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-state-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-mode-face)

(set-face-attribute 'mode-line nil
    :foreground "gray60" :background "gray20"
    :inverse-video nil
    :box '(:line-width 6 :color "gray20" :style nil))
(set-face-attribute 'mode-line-inactive nil
    :foreground "gray60" :background "gray40"
    :inverse-video nil
    :box '(:line-width 6 :color "gray40" :style nil))
(set-face-attribute 'mode-line-base-face nil
    :inherit 'mode-line-face
    :family "Menlo" :height 120)
(set-face-attribute 'mode-line-read-only-face nil
    :inherit 'mode-line-face
    :foreground "#4271ae")
(set-face-attribute 'mode-line-state-face nil
    :inherit 'mode-line-face
    :foreground "#000000"
    :background "#eab700")
(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face
    :foreground "gray60" :background "gray20")
(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-face
    :foreground "#eab700" :background "gray20"
    :weight 'bold)
(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "gray60" :background "gray20")

;; Animate nyan cat
(nyan-start-animation)

(load-theme 'misterioso t)
