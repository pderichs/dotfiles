;; emacs initialization file.
;; patderichs@gmail.com
;;

(setq edit-config       "~/.emacs.d/edit.el")
(setq interface-config  "~/.emacs.d/interface.el")
(setq ido-mode-config   "~/.emacs.d/ido.el")
(setq ruby-config       "~/.emacs.d/ruby.el")
(setq mac-os-config     "~/.emacs.d/mac.el")
(setq packages-config   "~/.emacs.d/packages.el")
(setq projectile-config "~/.emacs.d/projectile.el")
(setq keys-config       "~/.emacs.d/keys.el")
(setq file-type-config  "~/.emacs.d/file_types.el")
(setq cpp-config        "~/.emacs.d/cpp.el")
(setq goto-sym-function "~/.emacs.d/goto_symbol.el")

(load edit-config)
(load interface-config)
(load ido-mode-config)
(load ruby-config)
(load mac-os-config)
(load packages-config)
(load projectile-config)
(load keys-config)
(load goto-sym-function)
