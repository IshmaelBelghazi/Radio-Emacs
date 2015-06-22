;; C mode hooks
(defun flycheck-compdb-setup ()
  (when (and ede-object (oref ede-object compilation))
    (let* ((comp (oref ede-object compilation))
           (cmd (get-command-line comp)))
      ;; Configure flycheck clang checker.
      ;; TODO: configure gcc checker also
      (when (string-match " -std=\\([^ ]+\\)" cmd)
        (setq-local flycheck-clang-language-standard (match-string 1 cmd)))
      (when (string-match " -stdlib=\\([^ ]+\\)" cmd)
        (setq-local flycheck-clang-standard-library (match-string 1 cmd)))
      (when (string-match " -fms-extensions " cmd)
        (setq-local flycheck-clang-ms-extensions t))
      (when (string-match " -fno-exceptions " cmd)
        (setq-local flycheck-clang-no-exceptions t))
      (when (string-match " -fno-rtti " cmd)
        (setq-local flycheck-clang-no-rtti t))
      (when (string-match " -fblocks " cmd)
        (setq-local flycheck-clang-blocks t))
      (setq-local flycheck-clang-includes (get-includes comp))
      (setq-local flycheck-clang-definitions (get-defines comp))
      (setq-local flycheck-clang-include-path (get-include-path comp t))
      )))

(add-hook 'ede-compdb-project-rescan-hook #'flycheck-compdb-setup)
(add-hook 'ede-minor-mode-hook #'flycheck-compdb-setup)

(defun radio-c-mode-hook ()
  "Radio Emacs C mode hooks"
  ;; Irony Mode
  (irony-mode)
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async)
  (irony-cdb-autosetup-compile-options)
  ;; Irony Flycheck
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  ;; Irony Auto-complete
  (add-to-list 'ac-sources 'ac-source-irony)
  (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony-async)
  ;; Irony Flycheck
  (eldoc-mode 1)
  (irony-eldoc)
  ;; Google C-style
  (google-set-c-style)
  (google-make-newline-indent)
  ;; Doxymacs
  (doxymacs-mode 1)
  ;; Semantic
  ;;(semantic-gcc-setup)
  ;;(require 'semantic/bovine/gcc)
  ;;(require 'semantic/bovine/clang)
  ;;(add-to-list 'ac-sources 'ac-source-semantic)
  ;;(add-to-list 'ac-sources 'ac-source-semantic-raw)
  (require 'ede-compdb)
  (ede-minor-mode 1)
  ;;(semantic-mode 1)
 )

(add-hook 'c-mode-hook (lambda ()
			 (radio-c-mode-hook)
			 ))

(provide 'radio-C)
