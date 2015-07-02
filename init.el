;; Debug on Error

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)
;; Debug on error
(setq debug-on-error t)
;; El-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

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
;; **** Org Mode
(require 'radio-org)
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
;; **** Shell
(require 'radio-shell)
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
