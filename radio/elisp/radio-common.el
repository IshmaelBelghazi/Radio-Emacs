;; Disbaling ToolBar
(tool-bar-mode -1)
;; A better scroll bar
(global-yascroll-bar-mode t)
;; Zenburn Theme
(load-file "~/.emacs.d/el-get/zenburn/zenburn-theme.el")
(load-theme 'zenburn t)
;; Powerline Theme
(powerline-default-theme)
;; Move Between framebuffers
(require 'framemove)
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)
;; Dragstuff around
(require 'drag-stuff)
(drag-stuff-global-mode t)
(setq drag-stuff-modifier '(meta shift))
;; Popwin
;; Making annoying automatic buffers temporary. quit with "C-g"
(require 'popwin)
(popwin-mode 1)
(global-set-key (kbd "C-M-z") popwin:keymap)
;; Open init.el when pressing <f6>
(global-set-key (kbd "<f6>") (lambda() (interactive) (find-file "~/.emacs.d/init.el")))
;; Toggles menu bar
(global-set-key (kbd "C-<f11>") 'toggle-menu-bar-mode-from-frame)


(provide 'radio-common)
