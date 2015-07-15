;; Company-mode
(require 'company)
;;(company-quickhelp-mode t)
;;(setq company-minimum-prefix-length 2)
;; Company C- headers
;; Adding backends
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-minimum-prefix-length 2)               ; autocomplete right after '.'
(setq company-idle-delay 0.2)                         ; shorter delay before autocompletion popup
(setq company-echo-delay 0.2)                          ; removes annoying blinking
(setq company-require-match nil)
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
;; Dabbrev
(setq company-dabbrev-ignore-case nil)
(setq company-dabbrev-downcase nil)
()

(add-to-list 'company-backends 'company-c-headers)

(provide 'radio-company)
