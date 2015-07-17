(require 'cl)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; Preventing Builtin Cedet from loading
(setq load-path (remove-if (lambda (x) (string-match-p "cedet" x)) load-path))
(load-file (concat user-emacs-directory "/el-get/cedet/cedet-devel-load.el"))
(load-file (concat user-emacs-directory "/el-get/cedet/contrib/cedet-contrib-load.el"))

(require 'cc-mode)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-load-enable-all-ectags-support)

(semanticdb-enable-gnu-global-databases 'emacs-lisp-mode 1)
(semanticdb-enable-gnu-global-databases 'c-mode 1)
(semanticdb-enable-gnu-global-databases 'c++-mode 1)
(semanticdb-enable-gnu-global-databases 'matlab-mode 1)

(semantic-mode 1)

;; Enabling srecoder globally
(global-srecode-minor-mode 1)
;; Semantic System includes
;;(semantic-add-system-include "/usr/include" 'c-mode)
;;(semantic-add-system-include (getenv "R_INCLUDE_DIR") 'c-mode)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

;; (mapc (lambda (MODE) (add-to-list 'semantic-default-submodes MODE))
;;       '(global-semantic-mru-bookmark-mode
;;         global-semanticdb-minor-mode
;;         global-semantic-idle-scheduler-mode	
;;         global-semantic-stickyfunc-mode
;;         global-cedet-m3-minor-mode
;;         global-semantic-highlight-func-mode
;;         global-semanticdb-minor-mode))

;; ;; Activating semantic mode
;; (semantic-mode 1)
;; (mapc (lambda (MODE)
;; 	(add-hook 'MODE (lambda ()
;; 		    (when (boundp 'semantic-ia-complete-symbol) (add-to-list 'completion-at-point-functions 'semantic-ia-complete-symbol))
;; 		    (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
;; 		    (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
;; 		    (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;; 		    (local-set-key "\C-c=" 'semantic-decoration-include-visit)
;; 		    (local-set-key "\C-cj" 'semantic-ia-fast-jump)
;; 		    (local-set-key "\C-cq" 'semantic-ia-show-doc)
;; 		    (local-set-key "\C-cs" 'semantic-ia-show-summary)
;; 		    (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
;; 		  )
;; 	) '(c-mode-common-hook lisp-mode-hook emacs-lisp-mode-hook 'matlab-mode-hook))

;; (add-hook 'c-mode-common-hook (lambda ()
;;                                 (local-set-key "\C-ct" 'eassist-switch-h-cpp)
;;                                 (local-set-key "\C-xt" 'eassist-switch-h-cpp)
;;                                 (local-set-key "\C-ce" 'eassist-list-methods)
;;                                 (local-set-key "\C-c\C-r" 'semantic-symref)))
;; ;; Semantic DB
;; (semanticdb-enable-gnu-global-databases 'c-mode 1)
;; (semanticdb-enable-gnu-global-databases 'c++-mode 1)
;; (semanticdb-enable-gnu-global-databases 'matlab-mode 1)


(provide 'radio-cedet)
