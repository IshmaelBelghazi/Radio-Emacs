(defun radio-ac-makefile-mode-setup ()
  "Radio Emacs Makefile mode Auto-Complete setup"
  (setq ac-sources (append ac-sources '(ac-source-semantic-raw
					ac-source-yasnippet
					ac-source-files-in-current-dir
					ac-source-filename
					ac-source-dabbrev)))
  )

(defun radio-makefile-mode-hooks ()
  "Radio Emacs Makefile mode hooks"
  (semantic-mode t)
  (auto-complete-mode t)
  )

(add-hook 'makefile-mode-hook (lambda ()
				(radio-makefile-mode-hooks)
				))
(provide 'radio-makefile)
