;;; autocompletion.el -*- lexical-binding: t; -*-

;; Turn off auto completion popup - can be manually triggered by C-SPC
(after! corfu
  (setq corfu-auto nil))

;; Turn off auto completion in org-roam
;; (after! org-roam
;;   (setq org-roam-completion-everywhere nil))
