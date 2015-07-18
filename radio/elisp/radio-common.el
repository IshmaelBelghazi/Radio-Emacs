;; Alias for yes or no
(defalias 'yes-or-no-p 'y-or-n-p)
;; Fully redraw buffer
(setq redisplay-dont-pause t)
;; Disbaling Scroll bar
(scroll-bar-mode -1)
;; Disbaling ToolBar
(tool-bar-mode -1)
;; A better scroll bar
(global-yascroll-bar-mode t)
;; Zenburn Theme
(load-file "~/.emacs.d/el-get/zenburn/zenburn-theme.el")
(load-theme 'zenburn t)
;; Powerline + Evil mode powerline

;; Move Between framebuffers
(require 'framemove)
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)
;; Dragstuff around
(drag-stuff-global-mode t)
(setq drag-stuff-modifier '(control meta)) 
;; Popwin
;; Making annoying automatic buffers temporary. quit with "C-g"
(require 'popwin)
(popwin-mode 1)
(global-set-key (kbd "C-M-z") popwin:keymap)
;; Compile command
(global-set-key (kbd "<f5>") (lambda ()
			       (interactive)
;;			       (setq-local compilation-read-command nil)
			       (call-interactively 'compile)
			       ))
;; Open init.el when pressing <f6>
(global-set-key (kbd "<f6>") (lambda() (interactive) (find-file "~/.emacs.d/init.el")))
;; Toggles menu bar
(global-set-key (kbd "C-<f11>") 'toggle-menu-bar-mode-from-frame)
;; Disable scroll bar
(setq scroll-bar-mode -1)
;; Global subword mode
(global-subword-mode 1)
;; Enable erase buffer
(put 'erase-buffer 'disabled nil)

(provide 'radio-common)
