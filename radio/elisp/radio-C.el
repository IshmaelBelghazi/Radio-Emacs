;; Clang Complete Async
(defun radio-ac-clang-async-c-setup ()
  "Radio Emacs Auto-Complete Clang Async Setup"  
  (setq ac-clang-complete-executable "~/.emacs.d/el-get/clang-complete-async/clang-complete")
  (add-to-list 'ac-sources 'ac-source-clang-async)
  (ac-clang-launch-completion-process)
  (radio-get-system-clang-cflags)
  (radio-get-pkg-config-cflags "libR")
  )

;; Clang Complete cflags
(defun radio-get-system-clang-cflags ()
  "Radio Emacs Auto-Complete Clang CFLAGS getter -- Adapted From Oh My Emacs" 
  (setq command "echo | g++ -v -x c++ -E - 2>&1 |
                 grep -A 20 starts | grep include | grep -v search")
  (setq ac-clang-flags
        (mapcar (lambda (item)
                  (concat "-I" item))
                (split-string
                 (shell-command-to-string command))))
  (push "-code-completion-macros" ac-clang-flags)
  (push "-code-completion-patterns" ac-clang-flags)
  )

(defun radio-get-pkg-config-cflags (pkg-config-lib)
  "Radio Emacs Auto-Complete pkg-config library CFLAGS getter -- Copied from Oh My Emacs"
  (interactive "spkg-config lib: ")
  (if (executable-find "pkg-config")
      (if (= (shell-command
              (format "pkg-config %s" pkg-config-lib))
             0)
          (setq ac-clang-flags
                (append ac-clang-flags
                        (split-string
                         (shell-command-to-string
                          (format "pkg-config --cflags-only-I %s"
                                  pkg-config-lib)))))
        (message "Error, pkg-config lib %s not found." pkg-config-lib))
    (message "Error: pkg-config tool not found."))
  )
(defun radio-c-eldoc-setup ()
  "Radio Emacs C-Eldoc Setup"
  (setq c-eldoc-cpp-command (shell-command-to-string "which clang"))
  (c-turn-on-eldoc-mode)
  )
;; c-eldoc config
;; Complete Headers
(defun radio-c-mode-hook ()
  "Radio Emacs C mode hooks"
  (radio-ac-clang-async-c-setup)
  (radio-c-eldoc-setup)
  (doxymacs-mode)
  )

(add-hook 'c-mode-common-hook (lambda ()
				(radio-c-mode-hook)
				))

(provide 'radio-C)
