;; Enabling projectile everywhere
(projectile-global-mode)
;; Enabling helm projectile
(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

(provide 'radio-projectile)
