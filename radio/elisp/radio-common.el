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
(drag-stuff-global-mode t)

(provide 'radio-common)
