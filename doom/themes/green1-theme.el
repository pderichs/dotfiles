;;; green1-theme.el --- custom theme for faces  -*- lexical-binding:t -*-

;; Copyright (C) 2023 by pderichs.

;; Author: pderichs <derichs@posteo.de>

;;; Commentary:

;; Sample theme.
;; Thanks to Xah Lee (http://xahlee.info/emacs/emacs/emacs_create_theme.html)

;;; Code:

(deftheme green1
  "Just a theme with a light green background.")

(custom-theme-set-faces
 'green1
 ;; '(default ((t (:background "honeydew"))))
 '(default ((t (:background "#c1f4c4"))))
 '(font-lock-constant-face ((t (:foreground "black" :bold t))))
 '(font-lock-variable-name-face ((t (:foreground "red" :bold t))))
 ;;
 )

(provide-theme 'green1)

;;; green1-theme.el ends here
