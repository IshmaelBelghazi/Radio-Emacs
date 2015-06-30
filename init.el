;; Debug on Error
(setq debug-on-error t)
;; El-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; Loading CEDET
;; Unloading Builtin cedet
(require 'cl)

(setq load-path (remove-if (lambda (x) (string-match-p "cedet" x)) load-path))
;;(load-file (concat user-emacs-directory "/el-get/cedet/cedet-remove-builtin.el"))
;;(cedet-remove-builtin)
;; Loading devel CEDET
(load-file (concat user-emacs-directory "/el-get/cedet/cedet-devel-load.el"))
(load-file (concat user-emacs-directory "/el-get/cedet/contrib/cedet-contrib-load.el"))
(require 'semantic)
(require 'ede)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)
;;(global-semantic-idle-breadcrumbs-mode 1)
(semanticdb-enable-gnu-global-databases t)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch
	  ;; do not build recipes from emacswiki due to poor quality and
	  ;; documentation (From Oh-My-Emacs)
          el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (el-get-install 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			   ("melpa" . "http://melpa.org/packages/")))
  (el-get-elpa-build-local-recipes))
;; Adding Emacs Radio recipes
(add-to-list 'el-get-recipe-path "~/.emacs.d/radio/recipes")
;; Adding User personal recipes
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; Adding Emacs Radio elisps paths
(add-to-list 'load-path "~/.emacs.d/radio/elisp")
;; Adding personal elisp to path
(add-to-list 'load-path "~/.emacs.d/personal")
(require 'radio-packages)
(el-get 'sync radio-packages)
;;(el-get 'sync)
;; Paths

;; Misc
;; No startup messages
(setq inhibit-startup-message t)
;; * Loading Emacs-Radio
;; ** General
;; *** Common
(require 'radio-common)
;; *** Helm
(require 'radio-helm)
;; *** git
(require 'radio-git)
;; *** Projectile
(require 'radio-projectile)
;; *** Auto-complete
(require 'radio-ac)
;; *** Company
(require 'radio-company)
;; *** Yasnippets
(require 'radio-yasnippets)
;; *** Flycheck
(require 'radio-flycheck)
;; ** Edit
;; *** Common
;; *** Mode specific
;; **** Markdown
(require 'radio-markdown)
;; **** Restructured text
(require 'radio-rst)
;; **** Polymode Hooks
(require 'radio-poly)
;; ** Prog
;; *** Common
(require 'radio-prog-common)
;; *** General
;; **** CEDET
;;(require 'radio-cedet)
;; **** TAGS
(require 'radio-tags)
;; *** Language Specific
;; **** Elisp
;; **** Makefile
(require 'radio-makefile)
;; **** R
(require 'radio-R)
;; **** Python
(require 'radio-python)
;; **** Matlab
(require 'radio-matlab)
;; **** C
(require 'radio-C)
;; **** C++
;; **** CUDA
;; **** Web
;; **** CSS
;; **** Javascript
;; * Loading Helper functions
(require 'helper-fun)
(provide 'init)
;;; init.el ends here
(put 'erase-buffer 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (srefactor))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
