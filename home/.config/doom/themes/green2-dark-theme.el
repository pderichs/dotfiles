;;; green2-dark-theme.el --- A Doom theme with a dark green background -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: pderichs <derichs@posteo.de>
;;
;;; Commentary:
;;
;; A dark Doom theme that mirrors `green2' on the opposite side of the
;; brightness spectrum: a deep forest-green background with brighter,
;; nature-inspired syntax colors (leafy greens, soft warm reds, amber
;; oranges, and muted blues) tuned to pop on the dark canvas while
;; keeping the harmonious feel of `green2'.
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup green2-dark-theme nil
  "Options for the `green2-dark' theme."
  :group 'doom-themes)

(defcustom green2-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'green2-dark-theme
  :type 'boolean)

(defcustom green2-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'green2-dark-theme
  :type 'boolean)

(defcustom green2-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'green2-dark-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme green2-dark
  "A dark theme with a deep forest-green background and harmonious colors."
  :family 'green2
  :background-mode 'dark

  ;; name        default   256       16
  ((bg         '("#142a14" "#1c1c1c" "black"        ))
   (fg         '("#c8e0c8" "#d7d7af" "brightwhite"  ))

   ;; Off-color variants for solaire-mode and subtle highlights.
   (bg-alt     '("#0f220f" "#121212" "black"        ))
   (fg-alt     '("#7a9c7a" "#87875f" "white"        ))

   ;; A spectrum from bg (base0 = starker bg) to fg (base8 = starker fg).
   (base0      '("#0a180a" "black"   "black"        ))
   (base1      '("#142a14" "#1c1c1c" "brightblack"  ))
   (base2      '("#1a331a" "#262626" "brightblack"  ))
   (base3      '("#243d24" "#303030" "brightblack"  ))
   (base4      '("#3d5a3d" "#3a3a3a" "brightblack"  ))
   (base5      '("#5a7a5a" "#5f875f" "brightblack"  ))
   (base6      '("#7a9c7a" "#87875f" "brightblack"  ))
   (base7      '("#a8c8a8" "#afafaf" "brightblack"  ))
   (base8      '("#e6f0e6" "#e4e4e4" "white"        ))

   (grey       base4)
   (red        '("#e07474" "#d75f5f" "red"          ))
   (orange     '("#e09a5a" "#d78a4a" "brightred"    ))
   (green      '("#7fc77f" "#87af87" "green"        ))
   (teal       '("#5fc0a8" "#5fafaf" "brightgreen"  ))
   (yellow     '("#d4b060" "#d7af5f" "yellow"       ))
   (blue       '("#7fb4d8" "#87afd7" "brightblue"   ))
   (dark-blue  '("#5a85a8" "#5f87af" "blue"         ))
   (magenta    '("#d088b8" "#d787af" "magenta"      ))
   (violet     '("#c898d4" "#af87d7" "brightmagenta"))
   (cyan       '("#5fc0bd" "#5fafaf" "brightcyan"   ))
   (dark-cyan  '("#3a8a88" "#008787" "cyan"         ))

   ;; Universal syntax classes required by doom-themes.
   (highlight      green)
   (vertical-bar   (doom-lighten base2 0.05))
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if green2-dark-brighter-comments teal (doom-blend fg-alt green 0.4)))
   (doc-comments   (doom-lighten comments 0.15))
   (constants      violet)
   (functions      blue)
   (keywords       red)
   (methods        cyan)
   (operators      (doom-lighten fg 0.05))
   (type           yellow)
   (strings        green)
   (variables      (doom-lighten magenta 0.1))
   (numbers        orange)
   (region         `(,(doom-lighten (car bg) 0.15) ,@(doom-lighten (cdr base3) 0.1)))
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; Extra color variables used only in this theme.
   (modeline-fg              fg)
   (modeline-fg-alt          (doom-blend violet base5
                                         (if green2-dark-brighter-modeline 0.5 0.2)))
   (modeline-bg              (if green2-dark-brighter-modeline
                                 (doom-lighten bg 0.10)
                               (doom-lighten bg 0.05)))
   (modeline-bg-alt          (if green2-dark-brighter-modeline
                                 (doom-lighten bg 0.13)
                               (doom-lighten bg 0.08)))
   (modeline-bg-inactive     (doom-darken bg 0.15))
   (modeline-bg-alt-inactive `(,(doom-darken (car bg-alt) 0.10) ,@(cdr base1)))

   ;; Unified "current line / current candidate" highlight.
   ;; A muted steel blue so contrast is consistent across all modes
   ;; (org, prog, vertico popups, ivy, solaire-treated buffers, etc.).
   (current-line '("#2f4a6e" "#5f5f87" "blue"))

   (-modeline-pad
    (when green2-dark-padded-modeline
      (if (integerp green2-dark-padded-modeline) green2-dark-padded-modeline 4))))

  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if green2-dark-brighter-comments base0 'unspecified)
    :slant 'italic)
   ((font-lock-doc-face &override) :slant 'italic)
   ((line-number &override) :foreground (doom-blend base5 bg 0.6))
   ((line-number-current-line &override) :foreground base8 :bold bold)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if green2-dark-brighter-modeline base8 highlight))
   (shadow :foreground base5)
   (tooltip :background base1 :foreground fg)
   (fringe :background bg :foreground base4)
   (cursor :background base8)
   (hl-line :background current-line)

   ;;;; centaur-tabs
   (centaur-tabs-unselected :background bg-alt :foreground base5)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if green2-dark-brighter-modeline modeline-bg highlight))
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
   (magit-diff-removed  :foreground (doom-lighten red 0.1)
                        :background (doom-blend red bg 0.15))
   (magit-diff-removed-highlight :foreground red
                                 :background (doom-blend red bg 0.25)
                                 :bold bold)
   (magit-diff-added :foreground (doom-lighten green 0.1)
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
   ;; TODO keywords: a warm, harmonious red that pops on the dark green bg
   ;; without clashing with the leafy palette.
   (org-todo :foreground "#e88a8a" :background (doom-blend red bg 0.2) :bold bold)
   (org-done :foreground (doom-blend green fg 0.6) :bold bold)
   (org-headline-todo :foreground "#e88a8a")
   (org-headline-done :foreground (doom-blend green fg-alt 0.5) :strike-through t)
   ;;;; posframe
   (ivy-posframe :background base0)
   ;;;; selectrum
   (selectrum-current-candidate :background current-line :foreground base8)
   ;;;; vertico
   (vertico-current :background current-line :foreground base8 :extend t)
   ;;;; ivy / counsel / swiper
   (ivy-current-match :background current-line :foreground base8 :distant-foreground base8)
   (swiper-line-face  :background current-line :foreground base8)
   ;;;; helm (current selection)
   (helm-selection    :background current-line :foreground base8 :distant-foreground base8)
   ;;;; company
   (company-tooltip-selection :background current-line :foreground base8)
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

;;; green2-dark-theme.el ends here
