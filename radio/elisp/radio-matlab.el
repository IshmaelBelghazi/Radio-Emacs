;; MATLAB mode
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
;; Setting matlab mode install path
(setq matlab-mode-install-path (list "/usr/local/MATLAB/R2013a/toolbox/"))
(setq matlab-mode-install-path (append matlab-mode-install-path (list "/usr/local/MATLAB/R2013a/toolbox/matlab")))
(setq matlab-indent-level 4)
(setq matlab-indent-function-body t)
(setq matlab-shell-command "matlab")
(setq matlab-shell-command-switches '("-nodisplay" "-nosplash"))
;(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
;; Setting mlint path
(setq mlint-program '("/usr/local/MATLAB/R2013a/bin/glnxa64/mlint"))
;; compute cyclic complexity
(setq mlint-calculate-cyclic-complexity-flag t)
;; Show warnings
(setq matlab-show-mlint-warnings t)

(defun radio-ac-matlab-mode-setup ()
  "Radio Emacs MATLAB mode auto-complete setup"
  (radio-ac-prog-modes-setup)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (add-to-list 'ac-sources 'ac-source-semantic-raw)
  (add-to-list 'ac-sources 'ac-source-gtags)
 
  )

;; Matlab Mode hooks
(defun radio-matlab-mode-hooks ()
  "Radio Emacs Matlab Mode Hooks"
  (radio-prog-mode-hooks)
  (semantic-mode t)
  (matlab-cedet-setup)
  (radio-ac-matlab-mode-setup)
  (auto-complete-mode t)
  (mlint-minor-mode t)
  ;;(ggtags-mode t)
  )

(add-hook 'matlab-mode-hook (lambda ()
			      (radio-matlab-mode-hooks)
			      ))
;;MATLAB Shell Mode
;;MATLAB Shell Mode Hooks
(defun radio-matlab-shell-mode-hooks ()
  "Radio Emacs Matlab Shell Hooks"
  (company-mode t)
  (push 'company-matlab-shell company-backends)
  )

(add-hook 'matlab-shell-mode-hook (lambda ()
				    (radio-matlab-shell-mode-hooks)
				    ))

(provide 'radio-matlab)
