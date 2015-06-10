;; Clang Complete Async
(defun ac-clang-async-c-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/el-get/clang-complete-async/clang-complete")
  (add-to-list 'ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
  )

;; Complete Headers
(defun radio-c-mode-hook ()
  "Radio Emacs C mode hooks"
  (ac-clang-async-c-setup)
  )

(add-hook 'c-mode-common-hook (lambda ()
				(radio-c-mode-hook)
				))

(provide 'radio-C)
