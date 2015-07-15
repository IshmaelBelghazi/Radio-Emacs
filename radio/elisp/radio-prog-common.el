;; Make nice comments boxes using rebox2

;; smartparens
(require 'smartparens)
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))
;; Outshine
(require 'outshine)
(add-hook 'outline-minor-mode-hook 'outshine-hook-function)
;; Showparen
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; Prog mode radio hook
(defun radio-prog-mode-hooks ()
  "Radio Emacs prog mode hooks"
  (outline-minor-mode 1)
  (rebox-mode 1)
  (smartparens-mode 1)
  (rainbow-delimiters-mode 1)
;; Fic-ext mode: Highlights FIXME, TODO, BUG, etc ...
  (fic-ext-mode 1)
  (linum-mode 1)
  (eldoc-mode 1)
  (clean-aindent-mode 1)
  
  )

;; Prog mode Hooks
(add-hook 'prog-mode-hook (lambda()
			    (radio-ac-prog-modes-setup)
			    (radio-prog-mode-hooks)
			    ))

(provide 'radio-prog-common)
