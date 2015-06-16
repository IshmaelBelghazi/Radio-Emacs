(defun radio-ac-makefile-mode-setup ()
  "Radio Emacs Makefile mode Auto-Complete setup"
  (setq ac-sources (append ac-sources '(ac-source-semantic
					ac-source-dabbrev)))
  )

(defun radio-makefile-mode-hooks ()
  "Radio Emacs Makefile mode hooks"
  (semantic-mode t)
  (auto-complete-mode t)
  )

(provide 'radio-makefile)
