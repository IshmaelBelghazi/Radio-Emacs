;; Auto-complete
;; Pos-tip
(require 'pos-tip)
;; Auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(setq ac-quick-help-prefer-pos-tip t)
(setq ac-auto-show-menu 0.3)
(setq ac-quick-help-delay 0.6)

(defun radio-ac-text-modes-setup ()
  "Radio Emacs auto-complete text modes setup"
  (setq ac-sources '(ac-source-files-in-current-dir
		     ac-source-filename
		     ac-source-dictionary
		     ac-source-dabbrev
		     ac-source-yasnippet)))

(defun radio-ac-tex-modes-setup ()
  "Radio Emacs auto-complete tex modes setup"
  (setq ac-sources '(ac-source-files-in-current-dir
		     ac-source-filename
		     ac-source-dictionary
		     ac-source-dabbrev
		     ac-source-yasnippet
		     )))

(defun radio-ac-prog-modes-setup ()
  "Radio Emacs auto-complete prog modes setup"
  (setq ac-sources '(ac-source-files-in-current-dir
		     ac-source-filename
		     ac-source-dictionary
		     ac-source-yasnippet
		     )))



(provide 'radio-ac)
