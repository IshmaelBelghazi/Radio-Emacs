;; Elpy
(elpy-enable)

(defun radio-python-mode-hooks ()
  "Radio Emacs Python Mode Hooks"
  (jedi:setup)
  (setq jedi:complete-on-dot t)
  (company-mode t)
  (add-to-list 'company-backends 'company-jedi)
  )

(add-hook 'python-mode-hook (lambda ()
			      (radio-python-mode-hooks)
			      ))
(provide 'radio-python)
