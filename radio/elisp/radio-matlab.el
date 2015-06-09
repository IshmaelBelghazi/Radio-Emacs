;; MATLAB mode
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
;; Setting matlab mode install path
(setq matlab-mode-install-path (list "/usr/local/MATLAB/R2013a/toolbox/"))
(setq matlab-mode-install-path (append matlab-mode-install-path (list "/usr/local/MATLAB/R2013a/toolbox/matlab")))
(setq matlab-indent-level 4)
(setq matlab-indent-function-body t)
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
(matlab-cedet-setup)
;; Setting mlint path
(setq mlint-program '("/usr/local/MATLAB/R2013a/bin/glnxa64/mlint"))
;; compute cyclic complexity
(setq mlint-calculate-cyclic-complexity-flag t)
;; Show warnings
(setq matlab-show-mlint-warnings t)

;; Matlab Mode hooks
(defun radio-matlab-mode-hooks ()
  "Radio Emacs Matlab Mode Hooks"
  (radio-prog-mode-hooks)
  (auto-complete-mode t)
  (mlint-minor-mode)
  )

;; Matlab Shell Hooks
(defun radio-matlab-shell-hooks ()
  "Radio Emacs Matlab Shell Hooks"
  (company-mode t)
  (push 'company-matlab-shell company-backends)

  )
(provide 'radio-matlab)
