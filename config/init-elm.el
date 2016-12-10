;;; package --- Summary:
;;; Commentary:
;;; Code:
(use-package elm-mode
  :ensure t
  :init
  (add-hook 'elm-mode-hook #'elm-oracle-setup-completion)
  (add-hook 'elm-mode-hook #'auto-complete-mode)
  (add-hook 'elm-mode-hook #'elm-oracle-setup-ac))

(provide 'init-elm)
;;; init-elm.el ends here
