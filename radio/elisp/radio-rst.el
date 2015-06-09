;; rst mode
(setq auto-mode-alist
      (append '(("\\.rst\\'" . rst-mode)
                ("\\.rest\\'" . rst-mode)) auto-mode-alist))

(defun radio-rst-mode-hooks ()
  (auto-complete-rst-init)
  (setq auto-complete-rst-other-sources
      '(ac-source-filename
        ac-source-abbrev
        ac-source-dictionary
        ac-source-yasnippet))
  (auto-complete-mode t)
  )

(add-hook 'rst-mode-hook (lambda ()
			   (radio-rst-mode-hooks)
			   ))

(provide 'radio-rst)
