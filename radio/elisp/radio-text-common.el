;; Flyspell

(defun radio-text-modes-hooks ()
  "Radio text mode hooks"
  (flyspell-mode t)
  )

(add-hook 'text-mode-hook (lambda ()
			    (radio-ac-text-modes-setup)
			    (radio-text-modes-hooks)
			    ))
(provide 'radio-text-common)
