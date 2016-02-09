(require 'use-package)

(use-package smartparens
  :ensure t)

(use-package elixir-mode
  :ensure t
  :config
  (add-to-list 'elixir-mode-hook
               (defun auto-activate-ruby-end-mode-for-elixir-mode ()
                 (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
                      "\\(?:^\\|\\s-+\\)\\(?:do\\)")
                 (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
                 (ruby-end-mode +1)))
  (sp-with-modes '(elixir-mode)
                 (sp-local-pair "fn" "end"
                                :when '(("SPC" "RET"))
                                :actions '(insert navigate))
                 (sp-local-pair "do" "end"
                                :when '(("SPC" "RET"))
                                :post-handlers '(sp-ruby-def-post-handler)
                                :actions '(insert navigate))))

(provide 'init-elixir)
