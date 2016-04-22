(require 'init-evil)
(require 'seti-theme)
(load-theme 'seti t)

;; Colored delimiters
(require-package 'rainbow-delimiters)
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Color variables
(require-package 'diminish)
(require-package 'color-identifiers-mode)
(global-color-identifiers-mode)
(diminish 'color-identifiers-mode)

(global-hl-line-mode t)
(provide 'init-interface)
