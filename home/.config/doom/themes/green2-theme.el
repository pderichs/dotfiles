;;; green2-theme.el --- A Doom theme with a light green background -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: pderichs <derichs@posteo.de>
;;
;;; Commentary:
;;
;; A light Doom theme with a soft light green background and harmonious,
;; nature-inspired syntax colors (forest greens, warm reds, earthy oranges,
;; and muted blues) chosen to be easy on the eyes and sit pleasantly on the
;; green canvas.  Inspired by the author's earlier `green1' theme.
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup green2-theme nil
  "Options for the `green2' theme."
  :group 'doom-themes)

(defcustom green2-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'green2-theme
  :type 'boolean)

(defcustom green2-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'green2-theme
  :type 'boolean)

(defcustom green2-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'green2-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme green2
  "A light theme with a soft green background and harmonious colors."

  ;; name        default   256       16
  ((bg         '("#d4f3d4" "#d7ffd7" "white"        ))
   (fg         '("#1c3a1c" "#1c3a1c" "black"        ))

   ;; Off-color variants for solaire-mode and subtle highlights.
   (bg-alt     '("#c8ecc8" "#c6ffc6" "white"        ))
   (fg-alt     '("#5a7a5a" "#5f875f" "brightblack"  ))

   ;; A spectrum from bg (base0) to fg (base8).
   (base0      '("#e6f7e6" "#e6ffe6" "white"        ))
   (base1      '("#dbf0db" "#d7ffd7" "brightblack"  ))
   (base2      '("#c8e6c8" "#c6ffc6" "brightblack"  ))
   (base3      '("#a8d0a8" "#afd7af" "brightblack"  ))
   (base4      '("#7a9c7a" "#87875f" "brightblack"  ))
   (base5      '("#3d5a3d" "#3a3a3a" "brightblack"  ))
   (base6      '("#2a402a" "#262626" "brightblack"  ))
   (base7      '("#1c2d1c" "#1c1c1c" "brightblack"  ))
   (base8      '("#0e170e" "black"   "black"        ))

   (grey       base4)
   (red        '("#a83232" "#af0000" "red"          ))
   (orange     '("#b5651c" "#af5f00" "brightred"    ))
   (green      '("#1f6a1f" "#005f00" "green"        ))
   (teal       '("#1f7a6e" "#008787" "brightgreen"  ))
   (yellow     '("#a05a0c" "#af5f00" "yellow"       ))
   (blue       '("#1a5a8a" "#005f87" "brightblue"   ))
   (dark-blue  '("#7aa5c5" "#87afaf" "blue"         ))
   (magenta    '("#8a2a7a" "#870087" "magenta"      ))
   (violet     '("#9a3a6a" "#af5f87" "brightmagenta"))
   (cyan       '("#147a78" "#00afaf" "brightcyan"   ))
   (dark-cyan  '("#0d4060" "#005f5f" "cyan"         ))

   ;; Universal syntax classes required by doom-themes.
   (highlight      green)
   (vertical-bar   (doom-darken base2 0.1))
   (selection      (doom-darken bg 0.15))
   (builtin        magenta)
   (comments       (if green2-brighter-comments teal (doom-blend fg-alt green 0.4)))
   (doc-comments   (doom-darken comments 0.15))
   (constants      violet)
   (functions      blue)
   (keywords       red)
   (methods        cyan)
   (operators      (doom-darken fg 0.05))
   (type           yellow)
   (strings        green)
   (variables      (doom-darken magenta 0.2))
   (numbers        orange)
   (region         `(,(doom-darken (car bg) 0.18) ,@(doom-darken (cdr base2) 0.2)))
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; Extra color variables used only in this theme.
   (modeline-fg              fg)
   (modeline-fg-alt          (doom-blend violet base4
                                         (if green2-brighter-modeline 0.5 0.2)))
   (modeline-bg              (if green2-brighter-modeline
                                 (doom-darken bg 0.12)
                               (doom-darken bg 0.07)))
   (modeline-bg-alt          (if green2-brighter-modeline
                                 (doom-darken bg 0.16)
                               (doom-darken bg 0.1)))
   (modeline-bg-inactive     (doom-darken bg 0.04))
   (modeline-bg-alt-inactive `(,(doom-darken (car bg-alt) 0.05) ,@(cdr base1)))

   ;; Unified "current line / current candidate" highlight.
   ;; A fixed soft blue so contrast is consistent across all modes
   ;; (org, prog, vertico popups, ivy, solaire-treated buffers, etc.).
   (current-line '("#a5c4e0" "#87afaf" "brightblue"))

   (-modeline-pad
    (when green2-padded-modeline
      (if (integerp green2-padded-modeline) green2-padded-modeline 4))))

  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if green2-brighter-comments base0 'unspecified)
    :slant 'italic)
   ((font-lock-doc-face &override) :slant 'italic)
   ((line-number &override) :foreground (doom-blend base4 bg 0.6))
   ((line-number-current-line &override) :foreground base8 :bold bold)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if green2-brighter-modeline base8 highlight))
   (shadow :foreground base4)
   (tooltip :background base1 :foreground fg)
   (fringe :background bg :foreground base4)
   (cursor :background base8)
   (hl-line :background current-line)

   ;;;; centaur-tabs
   (centaur-tabs-unselected :background bg-alt :foreground base4)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if green2-brighter-modeline modeline-bg highlight))
   ;;;; ediff <built-in>
   (ediff-current-diff-A        :foreground red   :background (doom-blend red   bg 0.2))
   (ediff-current-diff-B        :foreground green :background (doom-blend green bg 0.2))
   (ediff-current-diff-C        :foreground blue  :background (doom-blend blue  bg 0.2))
   (ediff-current-diff-Ancestor :foreground teal  :background (doom-blend teal  bg 0.2))
   ;;;; helm
   (helm-candidate-number :background green :foreground bg)
   ;;;; lsp-mode
   (lsp-ui-doc-background :background base0)
   ;;;; magit
   (magit-blame-heading :foreground orange :background bg-alt)
   (magit-diff-removed  :foreground (doom-darken red 0.2)
                        :background (doom-blend red bg 0.1))
   (magit-diff-removed-highlight :foreground red
                                 :background (doom-blend red bg 0.2)
                                 :bold bold)
   (magit-diff-added :foreground (doom-darken green 0.1)
                     :background (doom-blend green bg 0.15))
   (magit-diff-added-highlight :foreground green
                               :background (doom-blend green bg 0.25)
                               :bold bold)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground green)
   ((markdown-code-face &override)       :background base1)
   (mmm-default-submode-face :background base1)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground green)
   ((outline-2 &override) :foreground blue)
   ((outline-3 &override) :foreground orange)
   ;;;; org <built-in>
   ((org-block &override) :background base1)
   ((org-block-begin-line &override) :foreground fg :slant 'italic)
   (org-ellipsis :underline nil :background bg :foreground green)
   ((org-quote &override) :background base1)
   ;; TODO keywords: a warm, harmonious red that pops on the light green bg
   ;; without clashing with the leafy palette.
   (org-todo :foreground "#b03a3a" :background (doom-blend red bg 0.15) :bold bold)
   (org-done :foreground (doom-blend green fg 0.6) :bold bold)
   (org-headline-todo :foreground "#b03a3a")
   (org-headline-done :foreground (doom-blend green fg-alt 0.5) :strike-through t)
   ;;;; posframe
   (ivy-posframe :background base0)
   ;;;; selectrum
   (selectrum-current-candidate :background current-line :foreground fg)
   ;;;; vertico
   (vertico-current :background current-line :foreground fg :extend t)
   ;;;; ivy / counsel / swiper
   (ivy-current-match :background current-line :foreground fg :distant-foreground fg)
   (swiper-line-face  :background current-line :foreground fg)
   ;;;; helm (current selection)
   (helm-selection    :background current-line :foreground fg :distant-foreground fg)
   ;;;; company
   (company-tooltip-selection :background current-line :foreground fg)
   ;;;; solaire-mode
   (solaire-default-face :inherit 'default :background bg-alt)
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-alt-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt-inactive)))
   ;;;; show-paren
   (show-paren-match    :foreground green :background bg :bold bold :underline t)
   (show-paren-mismatch :foreground red   :background bg :bold bold)
   ;;;; web-mode
   (web-mode-current-element-highlight-face :background green :foreground bg)
   ;;;; wgrep <built-in>
   (wgrep-face :background base1)
   ;;;; whitespace
   ((whitespace-tab &override)         :background (if (not (default-value 'indent-tabs-mode)) base0 'unspecified))
   ((whitespace-indentation &override) :background (if (default-value 'indent-tabs-mode) base0 'unspecified)))

  ;;;; Base theme variable overrides
  ())

;;; green2-theme.el ends here
