;; ESS
(require 'ess-site)
(require 'ess-eldoc)
(require 'ess-rutils)
(require 'r-autoyas)
(require 'ess-edit)
(defun set-ess-mode-custom-key-binding ()
  "Set ess level custom key binding"
  (local-set-key (kbd "C-,") 'r-autoyas-expand)
  (local-set-key (kbd "M-C-,") 'ess-edit-indent-call-sophisticatedly)
  )

;; ESS dired
(autoload 'ess-rdired "ess-rdired" "View *R* objects in a dired-like buffer." t)
(setq ess-eval-visibly-p nil) ;; Otherwise buffers get too heavy and
(defun radio-ess-mode-hooks ()
  "Radio Emacs ESS Mode hooks"
  (r-autoyas-ess-activate)
  (ess-set-style 'C++ 'quiet)
  (setq ess-nuke-trailing-whitespace 'ask)
  (set-ess-mode-custom-key-binding)
  )


(add-hook 'ess-mode-hook (lambda()			  
			   (radio-prog-mode-hooks)
			   (radio-ess-mode-hooks)
			   ))


(provide 'radio-R)
