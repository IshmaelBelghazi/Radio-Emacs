;; Setting org-mode directory
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/gtd.org"))
;; ;; Org-mobile sync
;; (setq org-mobile-inbox-for-pull (concat org-directory "/gtd.org"))
;; ;; Org-mobile Apps dropbox directory
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; (org-mobile-sync-mode t)  

;;,----------------------------
;;| Org-mode Autocomplete setup
;;`----------------------------
(defun radio-ac-org-mode-setup ()
  "Radio Emacs Org mode setup"
  (auto-complete-mode t)
  (radio-ac-tex-modes-setup)
  (require 'org-ac)
  (org-ac/setup-current-buffer)
  )

;;,-------------------------
;;| Org mode Shortcuts setup 
;;`-------------------------
(defun radio-org-mode-shortcuts ()
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

;;,---------------------------
;;| Organisation and GTD setup
;;`---------------------------

;; Shortcuts to GTD and journal
(defun gtd ()
  (interactive)
  (find-file (concat org-directory "/gtd.org"))
  )
(global-set-key (kbd "<f12>") 'gtd)
(global-set-key (kbd "<C-M-f12>") 'personal_journal)
(global-set-key (kbd "<C-f12>") 'org-capture)
(global-set-key (kbd "<M-f12>") 'org-agenda)
(defun personal_journal ()
  (interactive)
  (find-file (concat org-directory "/journal.org"))
  )

(setq org-capture-templates
      '(
	("t" "Todo" entry (file+headline (concat org-directory "/gtd.org") "Tasks")
	 "* TODO %^{Brief Description} %^g\n%?\n\tAdded: %U")
	("j" "Journal" entry (file+datetree (concat org-directory "/journal.org"))
	 "* %?\nEntered on %U\n %i\n %a")
        )
      )


(defun radio-org-mode-organisation-gtd-setup ()
  "Radio Emacs Org-mode Organisation and Getting Things Done setup"
  ;; Getting things done
  (setq org-agenda-files '("~/Dropbox/org/gtd.org"))
  (setq org-agenda-ndays 7)
  (setq org-agenda-repeating-timestamp-show-all nil)
  (setq org-agenda-show-all-dates t)
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-sorting-strategy (quote
				     ((agenda time-up priority-down tag-up)
				      (todo tag-up))))
  (setq org-deadline-warning-days 7)
  (setq org-fast-tag-selection-single-key t)
  (setq org-refile-targets (quote (("gtd.org" :maxlevel . 3)
				   ("someday.org" :level . 2)
				   ("gtd_archive.org" :level . 1)
				   )))
  (setq org-reverse-note-order nil)
  (setq org-use-fast-todo-selection t)
  (setq org-use-tag-inheritance nil)
  ;; Setting Or agenda custom commands
  (setq org-agenda-custom-commands
	'(
	  ("P" "Projects" ((tags "PROJECT")))
	  ("O" "Office"
	   ((agenda)
	    (tags-todo "OFFICE")
	    (tags-todo "WORK_READING")
	    (tags-todo "ADMINISTRATIVE")))
	  ("H" "Home and School list"
	   ((agenda)
	    (tags-todo "THESIS")
	    (tags-todo "READING")
	    (tags-todo "HOMEWORK")
	    (tags-todo "ADMINISTRATIVE")
	    (tags-todo "HOME")
	    ))
	  ("D" "Daily Action List"
	   ((agenda "" ((org-agenda-ndays 1)
			(org-agenda-sorting-strategy
			 (quote ((agenda time-up priority-down tag-up))))
			(org-deadline-warning-days 0)
			))))))
  ;; Open getting things done
  ;; Org capture


  )

;;,---------------
;;| Org mode hooks
;;`---------------
(defun radio-org-mode-hooks ()
  "Radio Emacs org mode Hooks"
  ;; Flyspell mode
  (set org-log-done 'time)
  (flyspell-mode 1)
  (ac-flyspell-workaround)
  (turn-on-org-cdlatex)
  ;; Adding Imenu
  (lambda () (imenu-add-menubar-index "Imenu"))
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
			   (radio-org-mode-shortcuts)
			   (radio-org-mode-organisation-gtd-setup)

			  ))

(provide 'radio-org)
