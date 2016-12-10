(require 'init-evil)
;; (require 'seti-theme)
;; (load-theme 'seti t)

;; Colored delimiters
(require-package 'rainbow-delimiters)
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Color variables
(require-package 'diminish)
(require-package 'color-identifiers-mode)
(global-color-identifiers-mode)
(diminish 'color-identifiers-mode)
(setenv "DICTIONARY" "en_GB")
(setq ispell-program-name "aspell")

(global-hl-line-mode t)
(provide 'init-interface)
