((auto-complete status "installed" recipe
		(:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)
		       :features auto-complete-config :post-init
		       (progn
			 (add-to-list 'ac-dictionary-directories
				      (expand-file-name "dict" default-directory))
			 (ac-config-default))))
 (auto-complete-c-headers status "installed" recipe
			  (:name auto-complete-c-headers :website "https://github.com/mooz/auto-complete-c-headers" :description "An auto-complete source for C/C++ header files." :type github :pkgname "mooz/auto-complete-c-headers" :depends auto-complete :prepare
				 (progn
				   (defun ac--c-headers-init nil
				     (require 'auto-complete-c-headers)
				     (add-to-list 'ac-sources 'ac-source-c-headers))
				   (add-hook 'c-mode-hook 'ac--c-headers-init)
				   (add-hook 'c++-mode-hook 'ac--c-headers-init))))
 (auto-complete-rst status "installed" recipe
		    (:name auto-complete-rst :description "Auto-complete extension for ReST and Sphinx" :type github :pkgname "tkf/auto-complete-rst" :depends auto-complete :prepare
			   (progn
			     (autoload 'auto-complete-rst-init "auto-complete-rst"))))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (clang-complete-async status "installed" recipe
		       (:name clang-complete-async :website "https://github.com/Golevka/emacs-clang-complete-async" :description "An emacs extension to complete C and C++ code using libclang." :type github :pkgname "Golevka/emacs-clang-complete-async" :build
			      '(("make"))
			      :depends auto-complete :features auto-complete-clang-async :prepare
			      (setq ac-clang-complete-executable
				    (expand-file-name
				     (concat
				      (el-get-package-directory "clang-complete-async")
				      "clang-complete")))))
 (company-jedi status "installed" recipe
	       (:name company-jedi :description "Company backend for Python jedi." :website "https://github.com/syohex/emacs-company-jedi" :type github :pkgname "syohex/emacs-company-jedi"))
 (company-mode status "installed" recipe
	       (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (company-quickhelp status "installed" recipe
		    (:name company-quickhelp :description "Adds documentation popup to completion candidates" :type github :pkgname "expez/company-quickhelp"))
 (ctable status "installed" recipe
	 (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (drag-stuff status "installed" recipe
	     (:name drag-stuff :website "https://github.com/rejeep/drag-stuff#readme" :description "Drag Stuff is a minor mode for Emacs that makes it possible to drag stuff, such as words, region and lines, around in Emacs." :features drag-stuff :type http :url "https://github.com/rejeep/drag-stuff/raw/master/drag-stuff.el"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (elpy status "installed" recipe
       (:name elpy :website "https://github.com/jorgenschaefer/elpy" :description "Emacs Python Development Environment" :type github :pkgname "jorgenschaefer/elpy" :post-init
	      (el-get-envpath-prepend "PYTHONPATH" default-directory)
	      :depends
	      (company-mode yasnippet highlight-indentation find-file-in-project idomenu pyvenv)))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
	     (deferred ctable)))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (ess status "installed" recipe
      (:name ess :description "Emacs Speaks Statistics: statistical programming within Emacs" :type github :pkgname "emacs-ess/ESS" :website "http://ess.r-project.org/" :info "doc/info/" :build
	     `(("make" "clean" "all" ,(concat "EMACS="
					      (shell-quote-argument el-get-emacs))))
	     :load "ess-autoloads.el" :prepare
	     (progn
	       (autoload 'R-mode "ess-site" nil t)
	       (autoload 'Rd-mode "ess-site" nil t)
	       (autoload 'Rnw-mode "ess-site" nil t))))
 (fic-ext-mode status "installed" recipe
	       (:name fic-ext-mode :description "Show FIXME/TODO/BUG(...) in special face only in comments and strings" :type emacswiki))
 (find-file-in-project status "installed" recipe
		       (:name find-file-in-project :type github :pkgname "technomancy/find-file-in-project" :description "Quick access to project files in Emacs"))
 (flycheck status "installed" recipe
	   (:name flycheck :type github :pkgname "flycheck/flycheck" :description "On-the-fly syntax checking extension" :build
		  '(("makeinfo" "-o" "doc/flycheck.info" "doc/flycheck.texi"))
		  :info "./doc" :depends
		  (dash pkg-info let-alist cl-lib)))
 (framemove status "installed" recipe
	    (:name framemove :description "FrameMove allows you to move focus between frames using arrow keys." :website "http://www.emacswiki.org/emacs/FrameMove" :type emacswiki :features framemove))
 (fringe-helper status "installed" recipe
		(:name fringe-helper :description "Helper functions for fringe bitmaps." :type github :pkgname "nschum/fringe-helper.el"))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (git-gutter status "installed" recipe
	     (:name git-gutter :description "Emacs port of GitGutter Sublime Text 2 Plugin" :website "https://github.com/syohex/emacs-git-gutter" :type github :pkgname "syohex/emacs-git-gutter"))
 (git-gutter-fringe status "installed" recipe
		    (:name git-gutter-fringe :type github :pkgname "syohex/emacs-git-gutter-fringe" :description "Fringe version of git-gutter.el" :depends
			   (git-gutter fringe-helper)))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
	      ("make")
	      :build/darwin
	      `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
	      :build/windows-nt
	      (let
		  ((generated-autoload-file
		    (expand-file-name "helm-autoloads.el"))
		   \
		   (backup-inhibited t))
	      (update-directory-autoloads default-directory)
	      nil)))
(highlight-indentation status "installed" recipe
(:name highlight-indentation :description "Function for highlighting indentation" :type git :url "https://github.com/antonj/Highlight-Indentation-for-Emacs"))
(idomenu status "installed" recipe
(:name idomenu :type emacswiki :description "imenu tag selection a la ido" :load-path "."))
(iedit status "installed" recipe
(:name iedit :description "Edit multiple regions with the same content simultaneously." :type emacswiki :features iedit))
(jedi status "installed" recipe
(:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :submodule nil :depends
(epc auto-complete python-environment)))
(let-alist status "installed" recipe
(:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.1" :type http :url "http://git.savannah.gnu.org/cgit/emacs.git/plain/lisp/let-alist.el"))
(markdown-mode status "installed" recipe
(:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type git :url "git://jblevins.org/git/markdown-mode.git" :prepare
(add-to-list 'auto-mode-alist
'("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
(matlab-mode status "installed" recipe
(:name matlab-mode :description "Major mode for MATLAB(R) dot-m files" :website "http://matlab-emacs.sourceforge.net/" :type cvs :module "matlab-emacs" :url ":pserver:anonymous@matlab-emacs.cvs.sourceforge.net:/cvsroot/matlab-emacs" :build
`(("touch" "Makefile")
("make" ,(format "EMACS=%s" el-get-emacs)))
:load-path
(".")
:features matlab-load))
(navi-mode status "installed" recipe
(:name navi-mode :description "Major-mode for easy buffer-navigation." :website "https://github.com/tj64/navi" :type github :pkgname "tj64/navi" :depends
(outshine outorg)))
(outorg status "installed" recipe
(:name outorg :description "Convert source-code buffers temporarily to Org-mode for comment editing." :website "https://github.com/tj64/outorg" :type github :pkgname "tj64/outorg"))
(outshine status "installed" recipe
(:name outshine :description "Outline with outshine outshines outline." :website "https://github.com/tj64/outshine" :type github :pkgname "tj64/outshine" :depends
(outorg)))
(pkg-info status "installed" recipe
(:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
(dash epl)))
(polymode status "installed" recipe
(:name polymode :description "Object oriented framework for multiple emacs\n       modes based on indirect buffers" :type github :pkgname "vitoshka/polymode" :load-path
("." "modes")))
(popup status "installed" recipe
(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
(pos-tip status "installed" recipe
(:name pos-tip :description "Show tooltip at point" :type emacswiki))
(powerline status "installed" recipe
(:name powerline :website "https://github.com/milkypostman/powerline" :depends
(cl-lib)
:description "Powerline for Emacs" :type github :pkgname "milkypostman/powerline" :load-path "." :features powerline))
(python-environment status "installed" recipe
(:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
(deferred)))
(pyvenv status "installed" recipe
(:name pyvenv :website "https://github.com/jorgenschaefer/pyvenv" :description "Python virtual environment interface for Emacs" :type github :pkgname "jorgenschaefer/pyvenv" :post-init
(el-get-envpath-prepend "PYTHONPATH" default-directory)))
(r-autoyas status "installed" recipe
(:name r-autoyas :website "https://github.com/mlf176f2/r-autoyas.el" :description "Automatic yasnippet creation for emacs lisp." :type github :pkgname "mlf176f2/r-autoyas.el"))
(rainbow-delimiters status "installed" recipe
(:name rainbow-delimiters :website "https://github.com/Fanael/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "Fanael/rainbow-delimiters"))
(rebox2 status "installed" recipe
(:name rebox2 :description "create, remove, edit boxes" :type github :pkgname "lewang/rebox2"))
(smartparens status "installed" recipe
(:name smartparens :description "Autoinsert pairs of defined brackets and wrap regions" :type github :pkgname "Fuco1/smartparens" :depends dash))
(yasnippet status "installed" recipe
(:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
(("git" "submodule" "update" "--init" "--" "snippets"))))
(zenburn status "installed" recipe
(:name zenburn :description The Zenburn colour theme ported to Emacs :type github :pkgname "bbatsov/zenburn-emacs")))
