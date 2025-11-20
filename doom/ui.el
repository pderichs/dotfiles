;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(setq pd/window-height 85)
(setq pd/window-width 150)

;;(setq used-font "JetBrains Mono")
(setq used-font "Courier 10 Pitch")
(if (string= (getenv "PD_LAPTOP") "1")
    (setq used-font-size 15)
  (setq used-font-size 22))
(setq doom-font (font-spec :family used-font :size used-font-size :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family used-font :size used-font-size))

;; Creates some space between lines
(setq-default line-spacing 7)

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function.
;;
;; The following sets the theme according to the current hour.
;; (setq pd/current-hour (nth 2 (decode-time)))
;; (if (>= pd/current-hour 18)
;;     (setq pd/ui-theme 'doom-city-lights)
;;   (setq pd/ui-theme 'pd-adwaita))
(setq pd/ui-theme 'zeno)

;; (if (string= (getenv "PD_LAPTOP") "1")
;;     (setq doom-theme pd/ui-theme)
;;   (setq doom-theme pd/ui-theme))
(setq doom-theme pd/ui-theme)

;; (pd-)adwaita: enable syntax highlighting in current line
(set-face-foreground 'highlight nil)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Set initial window size
(if (window-system)
    (if (string= (getenv "PD_LAPTOP") "1")
        (add-to-list 'default-frame-alist '(fullscreen . maximized))
      (set-frame-size (selected-frame) pd/window-width pd/window-height)))

;; Show full file path in title bar
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Same as scrolloff setting in vim
(setq scroll-margin 10)
