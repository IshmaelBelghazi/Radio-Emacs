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

;; Helm
(helm-mode t)
(helm-adaptive-mode t)
(helm-autoresize-mode t)

;; Helm Extensions

;; Magit

;; Git gutter fringe

(provide 'radio-common)
