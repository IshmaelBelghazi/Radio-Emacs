;; C mode hooks
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
  (auto-complete-mode 1)
  (add-to-list 'ac-sources 'ac-source-irony)
  (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony-async)
  ;; Irony Flycheck
  (eldoc-mode 1)
  (irony-eldoc)
  ;; Google C-style
  (google-set-c-style)
  (google-make-newline-indent)
 )

(add-hook 'c-mode-hook (lambda ()
			 (radio-c-mode-hook)
			 ))

(provide 'radio-C)
