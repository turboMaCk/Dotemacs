;;; package --- Summary:
;;; Commentary:
;;; Code:
(require 'use-package)

(use-package clojure-mode
  :ensure t)

(require-package 'cider)
(require-package 'flycheck-clojure)

(provide 'init-clojure)
;;; init-clojure.el ends here
