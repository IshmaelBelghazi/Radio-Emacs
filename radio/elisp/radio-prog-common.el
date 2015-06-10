;; Make nice comments boxes using rebox2

;; smartparens
(require 'smartparens)
(require 'smartparens-config)
;; Outshine
(require 'outshine)
(add-hook 'outline-minor-mode-hook 'outshine-hook-function)
;; Showparen
(show-paren-mode t)
(setq show-paren-style 'mixed)
;; Fic-ext mode: Highlights FIXME, TODO, BUG, etc ...

;; Prog mode radio hook
(defun radio-prog-mode-hooks ()
  "Radio Emacs prog mode hooks"
  (outline-minor-mode t)
  (rebox-mode t)
  (smartparens-mode t)
  (rainbow-delimiters-mode t)
  (fic-ext-mode t)
  (linum-mode t)
  )

;; Prog mode Hooks
(add-hook 'prog-mode-hook (lambda()
			    (radio-ac-prog-modes-setup)
			    (radio-prog-mode-hooks)
			    ))

(provide 'radio-prog-common)
