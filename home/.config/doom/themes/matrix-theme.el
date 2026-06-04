;;; matrix-theme.el --- Doom theme inspired by OpenCode's Matrix theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: pderichs <derichs@posteo.de>
;;
;;; Commentary:
;;
;; A Doom theme based on the "Matrix" theme from OpenCode
;; (https://opencode.ai), a hacker-style bright-green on near-black
;; palette accented with purple keywords, cyan properties, amber
;; constants and a sky-blue for info/links.
;;
;; Palette source: OpenCode desktop theme (dark variant).
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup matrix-theme nil
  "Options for the `matrix' theme."
  :group 'doom-themes)

(defcustom matrix-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'matrix-theme
  :type 'boolean)

(defcustom matrix-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'matrix-theme
  :type 'boolean)

(defcustom matrix-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'matrix-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme matrix
  "A hacker-style green-on-black theme inspired by OpenCode's Matrix palette."
  :background-mode 'dark

  ;; name        default   256       16
  ((bg         '("#0a0e0a" "black"   "black"        ))
   (fg         '("#62ff94" "#87ff87" "brightgreen"  ))

   ;; Off-color variants for solaire-mode and subtle highlights.
   (bg-alt     '("#070b07" "black"   "black"        ))
   (fg-alt     '("#8ca391" "#87af87" "green"        ))

   ;; A spectrum from bg (base0 = starker bg) to fg (base8 = starker fg).
   (base0      '("#050805" "black"   "black"        ))
   (base1      '("#0a0e0a" "#1c1c1c" "brightblack"  ))
   (base2      '("#0f160f" "#262626" "brightblack"  ))
   (base3      '("#1a221a" "#303030" "brightblack"  ))
   (base4      '("#2d3a2d" "#3a3a3a" "brightblack"  ))
   (base5      '("#4a5a4a" "#585858" "brightblack"  ))
   (base6      '("#6a7a6a" "#808080" "brightblack"  ))
   (base7      '("#8ca391" "#87af87" "white"        ))
   (base8      '("#c5e0c5" "#d7d7af" "brightwhite"  ))

   (grey       base4)
   ;; Matrix accent palette (taken from the OpenCode "Matrix" dark theme).
   (red        '("#ff4b4b" "#ff5f5f" "red"          ))
   (orange     '("#ffa83d" "#ff8700" "brightred"    ))
   (green      '("#2eff6a" "#5fff5f" "green"        ))   ; primary green
   (teal       '("#24f6d9" "#5fffd7" "brightgreen"  ))   ; property / operator
   (yellow     '("#e6ff57" "#ffff5f" "yellow"       ))   ; type
   (blue       '("#30b3ff" "#5fafff" "brightblue"   ))   ; info / link
   (dark-blue  '("#1a7ab8" "#005fff" "blue"         ))
   (magenta    '("#c770ff" "#af87ff" "magenta"      ))   ; accent / keyword
   (violet     '("#d088ff" "#d787ff" "brightmagenta"))
   (cyan       '("#24f6d9" "#5fffd7" "brightcyan"   ))
   (dark-cyan  '("#0fb89c" "#00afaf" "cyan"         ))

   ;; Universal syntax classes required by doom-themes.
   (highlight      green)
   (vertical-bar   (doom-lighten base2 0.05))
   (selection      (doom-blend green bg 0.25))
   (builtin        magenta)
   (comments       (if matrix-brighter-comments teal fg-alt))
   (doc-comments   (doom-lighten comments 0.15))
   (constants      orange)
   (functions      blue)
   (keywords       magenta)
   (methods        cyan)
   (operators      cyan)
   (type           yellow)
   (strings        '("#1cc24b" "#00d75f" "green"))     ; syntax-string (slightly muted green)
   (variables      fg)                                  ; syntax-variable = ink
   (numbers        orange)
   (region         `(,(doom-lighten (car bg) 0.12) ,@(doom-lighten (cdr base3) 0.1)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; Extra color variables used only in this theme.
   (modeline-fg              fg)
   (modeline-fg-alt          (doom-blend magenta base5
                                         (if matrix-brighter-modeline 0.5 0.2)))
   (modeline-bg              (if matrix-brighter-modeline
                                 (doom-lighten bg 0.10)
                               (doom-lighten bg 0.05)))
   (modeline-bg-alt          (if matrix-brighter-modeline
                                 (doom-lighten bg 0.13)
                               (doom-lighten bg 0.08)))
   (modeline-bg-inactive     (doom-darken bg 0.20))
   (modeline-bg-alt-inactive `(,(doom-darken (car bg-alt) 0.10) ,@(cdr base1)))

   ;; Unified "current line / current candidate" highlight.
   ;; A muted matrix-green band that pops against the near-black bg
   ;; while keeping consistent contrast in all modes.
   (current-line '("#1a3a26" "#005f5f" "green"))

   (-modeline-pad
    (when matrix-padded-modeline
      (if (integerp matrix-padded-modeline) matrix-padded-modeline 4))))

  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if matrix-brighter-comments base0 'unspecified)
    :slant 'italic)
   ((font-lock-doc-face &override) :slant 'italic)
   ((line-number &override) :foreground (doom-blend base5 bg 0.6))
   ((line-number-current-line &override) :foreground green :bold bold)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if matrix-brighter-modeline base8 highlight))
   (shadow :foreground base5)
   (tooltip :background base1 :foreground fg)
   (fringe :background bg :foreground base4)
   (cursor :background green)
   (hl-line :background current-line)

   ;;;; centaur-tabs
   (centaur-tabs-unselected :background bg-alt :foreground base5)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground teal)
   (css-selector             :foreground magenta)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if matrix-brighter-modeline modeline-bg highlight))
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
   (magit-diff-added :foreground (doom-lighten green 0.05)
                     :background (doom-blend green bg 0.15))
   (magit-diff-added-highlight :foreground green
                               :background (doom-blend green bg 0.25)
                               :bold bold)
   ;;;; markdown-mode (matches Matrix theme markdown overrides)
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground teal)        ; matrix markdown-heading
   ((markdown-code-face &override)       :background base1 :foreground strings)
   (markdown-link-face   :foreground blue :underline t)
   (markdown-url-face    :foreground teal :underline t)
   (mmm-default-submode-face :background base1)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground teal)
   ((outline-2 &override) :foreground blue)
   ((outline-3 &override) :foreground orange)
   ((outline-4 &override) :foreground magenta)
   ;;;; org <built-in>
   ((org-block &override) :background base1)
   ((org-block-begin-line &override) :foreground fg-alt :slant 'italic)
   (org-ellipsis :underline nil :background bg :foreground green)
   ((org-quote &override) :background base1)
   ;; TODO keywords: matrix red error color.
   (org-todo :foreground "#ff6b6b" :background (doom-blend red bg 0.2) :bold bold)
   (org-done :foreground (doom-blend green fg 0.4) :bold bold)
   (org-headline-todo :foreground "#ff6b6b")
   (org-headline-done :foreground (doom-blend green fg-alt 0.5) :strike-through t)
   ;;;; posframe
   (ivy-posframe :background base0)
   ;;;; selectrum
   (selectrum-current-candidate :background current-line :foreground green)
   ;;;; vertico
   (vertico-current :background current-line :foreground green :extend t)
   ;;;; ivy / counsel / swiper
   (ivy-current-match :background current-line :foreground green :distant-foreground green)
   (swiper-line-face  :background current-line :foreground green)
   ;;;; helm (current selection)
   (helm-selection    :background current-line :foreground green :distant-foreground green)
   ;;;; company
   (company-tooltip-selection :background current-line :foreground green)
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

;;; matrix-theme.el ends here
