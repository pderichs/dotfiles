;; Projectile
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)

;; Helm-projectile mode
(require 'helm-projectile)
(helm-projectile-on)
