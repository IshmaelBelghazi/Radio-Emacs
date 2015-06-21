;; Helm
(helm-mode t)
(helm-adaptive-mode t)
(helm-autoresize-mode t)
;; Helm Describe bindings
;; Enter a prefix key and C-h after it. You will see a list of bindings using Helm interface for narrowing.
(helm-descbinds-mode)
;; Key Bindings
;; Helm Find file
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; Show Helm kill ring
(global-set-key (kbd "C-c k") 'helm-show-kill-ring);; Helm Extensions
;; Helm M-x
(global-set-key (kbd "M-x") 'helm-M-x)
;; Helm mini
(global-set-key (kbd "C-x b") 'helm-mini)
;; Helm Occur
(global-set-key (kbd "C-c o") 'helm-occur)
;; Helm Semantic or Imenu
(global-set-key (kbd "C-c m") 'helm-semantic-or-imenu)
;; Helm Regex
(global-set-key (kbd "C-c r") 'helm-regexp)
;; Helm Flycheck
(global-set-key (kbd "C-c h f") 'helm-flycheck)

(provide 'radio-helm)
