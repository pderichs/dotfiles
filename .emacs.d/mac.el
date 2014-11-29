;; Command is Meta. Enable meta key of mac for brackets
;;(setq default-input-method "MacOSX")
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil)
  (global-set-key [kp-delete] 'delete-char))
