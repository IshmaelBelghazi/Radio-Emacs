;; Auto-complete
;; Pos-tip
(require 'pos-tip)
;; Auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(setq ac-quick-help-prefer-pos-tip t)
(provide 'radio-ac)
