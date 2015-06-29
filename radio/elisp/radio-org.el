(defun radio-ac-org-mode-setup ()
  "Radio Emacs Org mode setup"
  (auto-complete-mode t)
  (radio-ac-tex-modes-setup)
  (require 'org-ac)
  (org-ac/setup-current-buffer)

  )
(defun radio-org-shortcuts ()
  "Radio Emacs org mode shortcuts"
  ;; Shortcuts
  ;; R code
  (add-to-list 'org-structure-template-alist
	       '("r" "#+BEGIN_SRC R :results silent :session :exports code :tangle yes\n\n#+END_SRC"
		 "<src lang\"R\">\n\n</src>"))
					; Python code
  (add-to-list 'org-structure-template-alist
	       '("p" "#+BEGIN_SRC python :results output raw :exports both\n\n#+END_SRC"
		 "<src lang\"python\">\n\n</src>"))
  )

(defun radio-org-mode-hooks ()
  "Radio Emacs org mode Hooks"
  ;; Flyspell mode
  (flyspell-mode 1)
  (ac-flyspell-workaround)
  ;; Explicit exporter
  (require 'ox-latex)
  (require 'ox-html)
  (require 'ox-ascii)
  ;;,------
  ;;| Babel
  ;;`------
  (setq org-export-babel-evaluate nil)
  (setq org-confirm-babel-evaluate nil)
  (custom-set-faces)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (sh . t)
     (python . t)
     (R . t)
     (ruby . t)
     (ditaa . t)
     (dot . t)
     (octave . t)
     (matlab . t)
     (sqlite . t)
     (perl . t)
     (C . t)
     (screen . t)
     (plantuml . t)
     (lilypond . t)
     ))
  ;; Make windmove work in org-mode:
  (add-hook 'org-shiftup-final-hook 'windmove-up)
  (add-hook 'org-shiftleft-final-hook 'windmove-left)
  (add-hook 'org-shiftdown-final-hook 'windmove-down)
  (add-hook 'org-shiftright-final-hook 'windmove-right)
  )

(add-hook 'org-mode-hook (lambda ()
			   (radio-org-mode-hooks)
			   (radio-ac-org-mode-setup)
			   (radio-org-shortcuts)
			  ))

(provide 'radio-org)
