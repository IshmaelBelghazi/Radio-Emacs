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

;; EDE minor mode hooks
(add-hook 'ede-compdb-project-rescan-hook #'flycheck-compdb-setup)
(add-hook 'ede-minor-mode-hook #'flycheck-compdb-setup)
(add-hook 'ede-minor-mode-hook (lambda ()
				 (setq company-c-headers-path-system 'ede-object-system-include-path)))

(defun radio-c-mode-hook ()
  "Radio Emacs C mode hooks"
  ;; Google C-style
  (google-set-c-style)
  (google-make-newline-indent)
  ;; Doxymacs
  (doxymacs-mode 1)
  (require 'ede-compdb)
  (ede-minor-mode 1)
  (semantic-mode 1)
  (require 'srefactor)
  (define-key c-mode-map (kbd "C-f r") 'srefactor-refactor-at-point)
  ;; Find other file
  (define-key c-mode-map (kbd "C-f o") 'ff-find-other-file)  
 )

(add-hook 'c-mode-hook (lambda ()
			 (radio-c-mode-hook)
			 (company-mode 1)
			 (push 'company-c-headers company-backends)
			 (push 'company-semantic company-backends)
			 (push 'company-files company-backends)
			 ))

(provide 'radio-C)
