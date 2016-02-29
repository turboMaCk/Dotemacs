;;; package --- Summary:
;;; Commentary:
;;; Code:
(require-package 'elm-mode)
(add-hook 'elm-mode-hook #'elm-oracle-setup-completion)
(add-hook 'elm-mode-hook #'elm-oracle-setup-ac)

(provide 'init-elm)
;;; init-elm.el ends here
