;; Command is Meta. Enable meta key of mac for brackets
;;(setq default-input-method "MacOSX")
(when (eq system-type 'darwin)
  ;; Move modifier and meta keys
  ;; (setq mac-command-modifier 'meta)
  ;; (setq mac-option-modifier nil)
  ;; (setq ns-function-modifier 'control)
  ;; (setq ns-alternate-modifier 'control)
  ;; (setq ns-right-alternate-modifier nil))
  (global-set-key [kp-delete] 'delete-char))
