;; customized-base16-black-metal-burzum-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/tinted-theming/home)
;; Customized comment color.

;;; Authors:
;; Scheme: metalelf0 (https://github.com/metalelf0)
;; Template: Kaleb Elwert <belak@coded.io>
;;
;; (minor color modifications by pderichs <derichs@posteo.de>)

;;; Code:

(require 'base16-theme)

(defvar customized-base16-black-metal-burzum-theme-colors
  '(:base00 "#000000"
    :base01 "#1f1f1f"
    :base02 "#009acd"
    :base03 "#00688b"
    :base04 "#999999"
    :base05 "#c1c1c1"
    :base06 "#999999"
    :base07 "#c1c1c1"
    :base08 "#5f8787"
    :base09 "#aaaaaa"
    :base0A "#99bbaa"
    :base0B "#ddeecc"
    :base0C "#aaaaaa"
    :base0D "#888888"
    :base0E "#999999"
    :base0F "#444444")
  "All colors for Customized Base16 Black Metal (Burzum) are defined here.")

;; Define the theme
(deftheme customized-base16-black-metal-burzum)

;; Add all the faces to the theme
(base16-theme-define 'customized-base16-black-metal-burzum customized-base16-black-metal-burzum-theme-colors)

;; Mark the theme as provided
(provide-theme 'customized-base16-black-metal-burzum)

(provide 'customized-base16-black-metal-burzum-theme)

;;; customized-base16-black-metal-burzum-theme.el ends here
