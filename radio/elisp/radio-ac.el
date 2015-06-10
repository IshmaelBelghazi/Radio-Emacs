;; Auto-complete
;; Pos-tip
(require 'pos-tip)
;; Auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(setq ac-quick-help-prefer-pos-tip t)

(defun radio-text-modes-setup ()
  "Radio Emacs auto-complete text modes setup"
  (setq 'ac-sources '(ac-source-files-in-current-dir
		      ac-source-filename
		      ac-source-dictionary
		      ac-source-words-in-buffer
		      ac-source-yasnippet)))

(defun radio-ac-tex-modes-setup ()
  "Radio Emacs auto-complete tex modes setup"
  (setq 'ac-sources '(ac-source-files-in-current-dir
		      ac-source-filename
		      ac-source-dictionary
		      ac-source-words-in-buffer
		      ac-source-yasnippet
		      )))

(defun radio-ac-prog-modes-setup ()
  "Radio Emacs auto-complete prog modes setup"
  (setq 'ac-sources '(ac-source-dictionary
		      ac-source-filename
		      ac-source-files-in-current-dir
		      ac-source-yasnippet
		      )))



(provide 'radio-ac)
