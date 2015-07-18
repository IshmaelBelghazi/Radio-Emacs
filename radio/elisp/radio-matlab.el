;; MATLAB mode
;(require 'matlab-load)
;; (autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
;; (setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;; (autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
;; Setting MATLAB mode install path
(defun radio-get-matlab-toolboxes-path (matlabroot)
  "sets Matlab toolbox paths given matlab root path"
  (setq command (concat "find " matlabroot " -type d -maxdepth 1 -printf '%p\n'"))
  (split-string (shell-command-to-string command))
  )

(defun radio-get-mlint-path ()
  "Returns mlint path for flycheck in MATLAB mode"
  (setq command "which mlint")
  (replace-regexp-in-string "\n$" "" 
			    (shell-command-to-string command))
  )

;; install path
(setq matlab-shell-command "matlab")
(setq matlab-shell-command-switches '("-nodisplay" "-nosplash"))
;; Mlint path
;; (setq matlab-mlint "/usr/local/MATLAB/R2013a/bin/glnxa64/mlint")
;; (setq mlint-program "/usr/local/MATLAB/R2013a/bin/glnxa64/mlint")
;; (setq flycheck-matlab-mlint-executable "/usr/local/MATLAB/R2013a/bin/glnxa64/mlint")
;; Hooks
;; Matlab Mode
(add-hook 'matlab-mode-hook (lambda ()
			      (smartparens-mode 1)
			      (semantic-mode 1)
			      (require 'semantic-matlab)
			      ;; Matlab cedet setup
			      (matlab-cedet-setup)
			      (semantic-default-matlab-setup)
			      ;;(semanticdb-enable-gnu-global-databases 'matlab-mode)
			      (company-mode t)
			      (setq company-backends '(company-matlab
						       company-dabbrev-code
						       company-keywords
						       company-dabbrev))
			      (eval-after-load 'flycheck
				'(require 'flycheck-matlab-mlint))
			      ))
;; Matlab-shell mode hook
(add-hook 'matlab-shell-mode-hook (lambda ()
				    (smartparens-mode 1)
				    (eldoc-mode 1)
				    (company-mode 1)				    
				    ))

(provide 'radio-matlab)
