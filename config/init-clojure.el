;;; package --- Summary:
;;; Commentary:
;;; Code:
(require 'use-package)

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)
(use-package flycheck-clojure
  :ensure t)

(provide 'init-clojure)
;;; init-clojure.el ends here
