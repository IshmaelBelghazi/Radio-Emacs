;; Elpy


(defun radio-python-mode-hooks ()
  "Radio Emacs Python Mode Hooks"
  (elpy-enable)
  (jedi:setup)
  (setq jedi:complete-on-dot t)
  (auto-complete-mode -1)
  (setq elpy-rpc-backend "jedi")
  (company-mode t)
  
  ;;(add-to-list 'company-backends 'company-jedi)
  )

(add-hook 'python-mode-hook (lambda ()
			      (radio-python-mode-hooks)
			      ))
(provide 'radio-python)
