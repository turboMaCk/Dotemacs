(require 'auto-complete)
(require 'auto-complete-config)
(require 'ac-etags)

(setq ac-auto-show-menu t)
(setq ac-auto-start t)

(setq ac-quick-help-delay 0.3)
(setq ac-quick-help-height 30)
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-etags-requires 1)

(ac-config-default)
(ac-etags-setup)
