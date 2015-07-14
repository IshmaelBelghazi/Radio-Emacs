;; rst mode
(setq auto-mode-alist
      (append '(("\\.rst\\'" . rst-mode)
                ("\\.rest\\'" . rst-mode)) auto-mode-alist))

;; RST auto-complete
(require 'auto-complete-rst)
(auto-complete-rst-genesource-eval)
(add-to-list 'ac-modes 'rst-mode)
(setq auto-complete-rst-sphinx-extensions '("sphinx.ext.autodoc"
					    "sphinx.ext.doctest"
					    "sphinx.ext.todo"
					    "sphinx.ext.coverage"
					    "sphinx.ext.mathjax"
					    "sphinx.ext.ifconfig"
					    "sphinx.ext.viewcode"
					    "sphinx.ext.napoleon"
					    ))

(add-hook 'rst-mode-hook (lambda ()
			   (setq ac-sources '(ac-source-files-in-current-dir
					      ac-source-words-in-same-mode-buffers
					      ))
			   (add-to-list 'ac-sources 'ac-source-rst-directives)
			   (add-to-list 'ac-sources 'ac-source-rst-roles)
			   (add-to-list 'ac-sources 'ac-source-rst-options)
			   (local-set-key ":" 'auto-complete-rst-complete-colon)
			   (local-set-key " " 'auto-complete-rst-complete-space)
			   (auto-complete-mode 1)
			   
			   ))

(provide 'radio-rst)
