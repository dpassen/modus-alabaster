;;; modus-alabaster-light.el --- Alabaster light on modus-operandi -*- lexical-binding: t -*-

;; Copyright (C) 2026 Free Software Foundation, Inc.
;; Author: Derek Passen <dpassen1@gmail.com>
;; Maintainer: Derek Passen <dpassen1@gmail.com>
;; URL: https://github.com/dpassen/modus-alabaster
;; Keywords: faces, theme, accessibility

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; The `modus-alabaster' are a collection of themes for GNU Emacs.

;;; Code:

(require 'modus-alabaster)

(defconst modus-alabaster-light-palette
  (modus-themes-generate-palette
   '(
     ;; Upstream globals.
     (bg-main      "#F7F7F7")
     (bg-dim       "#F0F0F0") ; line_highlight
     (bg-active    "#BFDBFE") ; selection
     (bg-inactive  "#E0E0E0") ; inactive_selection
     (border       "#E0E0E0")
     (fringe       "#F7F7F7")
     (fg-main      "#000000")
     (fg-dim       "#777777")
     (fg-alt       "#AAAAAA")
     (cursor       "#007ACC")

     ;; The four syntax classes, plus punctuation and interaction.
     (alabaster-comment     "#AA3731")
     (alabaster-string      "#448C27")
     (alabaster-constant    "#7A3E9D")
     (alabaster-definition  "#325CC0")
     (alabaster-escape      "#777777")
     (alabaster-punctuation "#777777")
     (alabaster-operator    "#000000")
     (alabaster-bracket     "#777777")
     (alabaster-active      "#007ACC")
     (alabaster-error       "#AA3731")
     (alabaster-misspelling "#AA3731")
     (alabaster-search-fg   "#000000")

     ;; Modus accent vocabulary, restricted to upstream colours.
     (red          "#AA3731")
     (red-warmer   "#AA3731")
     (red-cooler   "#AA3731")
     (red-faint    "#AA3731")
     (red-intense  "#AA3731")
     (green        "#448C27")
     (green-warmer "#448C27")
     (green-cooler "#448C27")
     (green-faint  "#448C27")
     (green-intense "#448C27")
     (yellow        "#FFBC5D")
     (yellow-warmer "#FFBC5D")
     (yellow-cooler "#FFBC5D")
     (yellow-faint  "#FFBC5D")
     (yellow-intense "#FFBC5D")
     (blue         "#325CC0")
     (blue-warmer  "#325CC0")
     (blue-cooler  "#325CC0")
     (blue-faint   "#325CC0")
     (blue-intense "#325CC0")
     (magenta         "#7A3E9D")
     (magenta-warmer  "#7A3E9D")
     (magenta-cooler  "#7A3E9D")
     (magenta-faint   "#7A3E9D")
     (magenta-intense "#7A3E9D")
     (cyan         "#007ACC")
     (cyan-warmer  "#007ACC")
     (cyan-cooler  "#007ACC")
     (cyan-faint   "#007ACC")
     (cyan-intense "#007ACC")
     (rust   "#FFBC5D")
     (gold   "#FFBC5D")
     (olive  "#448C27")
     (slate  "#325CC0")
     (indigo "#7A3E9D")
     (maroon "#AA3731")
     (pink   "#7A3E9D")

     ;; color(red alpha(0.2)) composited over the upstream background.
     (bg-red-intense "#E8D1CF")
     (bg-red-subtle  "#E8D1CF")
     (bg-red-nuanced "#E8D1CF")
     ;; Alabaster has no other semantic coloured backgrounds.
     (bg-green-intense   "#F7F7F7")
     (bg-green-subtle    "#F7F7F7")
     (bg-green-nuanced   "#F7F7F7")
     (bg-yellow-intense  "#F7F7F7")
     (bg-yellow-subtle   "#F7F7F7")
     (bg-yellow-nuanced  "#F7F7F7")
     (bg-blue-intense    "#F7F7F7")
     (bg-blue-subtle     "#F7F7F7")
     (bg-blue-nuanced    "#F7F7F7")
     (bg-magenta-intense "#F7F7F7")
     (bg-magenta-subtle  "#F7F7F7")
     (bg-magenta-nuanced "#F7F7F7")
     (bg-cyan-intense    "#F7F7F7")
     (bg-cyan-subtle     "#F7F7F7")
     (bg-cyan-nuanced    "#F7F7F7")

     ;; Thematic and graph slots use only colours present upstream.
     (bg-clay     "#F7F7F7")
     (fg-clay     "#AA3731")
     (bg-ochre    "#F7F7F7")
     (fg-ochre    "#FFBC5D")
     (bg-lavender "#F7F7F7")
     (fg-lavender "#7A3E9D")
     (bg-sage     "#F7F7F7")
     (fg-sage     "#448C27")
     (bg-graph-red-0     "#D2322D")
     (bg-graph-red-1     "#D2322D")
     (bg-graph-green-0   "#6ABF40")
     (bg-graph-green-1   "#6ABF40")
     (bg-graph-yellow-0  "#EC8013")
     (bg-graph-yellow-1  "#EC8013")
     (bg-graph-blue-0    "#325CC0")
     (bg-graph-blue-1    "#325CC0")
     (bg-graph-magenta-0 "#7A3E9D")
     (bg-graph-magenta-1 "#7A3E9D")
     (bg-graph-cyan-0    "#007ACC")
     (bg-graph-cyan-1    "#007ACC")

     ;; Editor chrome.
     (bg-completion      "#E0E0E0")
     (bg-popup           "#F7F7F7")
     (bg-hover           "#BFDBFE")
     (bg-hover-secondary "#F0F0F0")
     (bg-hl-line         "#F0F0F0")
     (bg-region          "#BFDBFE")
     (fg-region          "#000000")
     (bg-mode-line-active       "#F0F0F0")
     (fg-mode-line-active       "#000000")
     (border-mode-line-active   "#E0E0E0")
     (bg-mode-line-inactive     "#E0E0E0")
     (fg-mode-line-inactive     "#777777")
     (border-mode-line-inactive "#E0E0E0")
     (modeline-err     "#AA3731")
     (modeline-warning "#AA3731")
     (modeline-info    "#007ACC")
     (bg-tab-bar     "#E0E0E0")
     (bg-tab-current "#F7F7F7")
     (bg-tab-other   "#F0F0F0")
     (fg-line-number-inactive "#777777")
     (fg-line-number-active   "#000000")
     (bg-line-number-inactive "#F7F7F7")
     (bg-line-number-active   "#F0F0F0")

     ;; Diff line backgrounds tint bg-main toward each state's accent, using
     ;; the same "accent at low alpha over bg-main" recipe as bg-red-subtle
     ;; above: the base/-highlight background is the accent at alpha 0.2, with
     ;; -faint (0.1) and -refine (0.3) bracketing it.  (bg-removed at 0.2 is
     ;; exactly #E8D1CF, matching bg-red-subtle.)  Without a background magit's
     ;; *-diff-*-highlight faces were invisible; the fringe and foreground stay
     ;; the vivid upstream accents so the gutter still reads at a glance.
     (bg-added         "#D3E2CD")
     (bg-added-faint   "#E5ECE2")
     (bg-added-refine  "#C1D7B9")
     (bg-added-fringe  "#6ABF40")
     (fg-added         "#6ABF40")
     (fg-added-intense "#6ABF40")
     (bg-removed         "#E8D1CF")
     (bg-removed-faint   "#EFE4E3")
     (bg-removed-refine  "#E0BDBC")
     (bg-removed-fringe  "#D2322D")
     (fg-removed         "#D2322D")
     (fg-removed-intense "#D2322D")
     (bg-changed         "#F9EBD8")
     (bg-changed-faint   "#F8F1E8")
     (bg-changed-refine  "#F9E5C9")
     (bg-changed-fringe  "#EC8013")
     (fg-changed         "#EC8013")
     (fg-changed-intense "#EC8013")
     (bg-diff-context "#F7F7F7")

     ;; Search, bracket matching, and prose blocks.
     (bg-search-current    "#FFBC5D")
     (bg-search-lazy       "#FFBC5D")
     (bg-search-static     "#FFBC5D")
     (bg-search-replace    "#FFBC5D")
     (bg-search-rx-group-0 "#FFBC5D")
     (bg-search-rx-group-1 "#FFBC5D")
     (bg-search-rx-group-2 "#FFBC5D")
     (bg-search-rx-group-3 "#FFBC5D")
     (bg-paren-match      "#F7F7F7")
     (bg-paren-expression "#F7F7F7")
     (fg-paren-match      "#007ACC")
     (bg-prose-block-delimiter "#F0F0F0")
     (fg-prose-block-delimiter "#000000")
     (bg-prose-block-contents  "#F0F0F0")

     ;; Terminal endpoints.
     (bg-term-black        "#000000")
     (fg-term-black        "#000000")
     (bg-term-black-bright "#777777")
     (fg-term-black-bright "#777777")
     (bg-term-white        "#AAAAAA")
     (fg-term-white        "#AAAAAA")
     (bg-term-white-bright "#F7F7F7")
     (fg-term-white-bright "#F7F7F7"))
   nil
   modus-themes-operandi-palette
   modus-alabaster-common-palette-mappings)
  "Full palette for `modus-alabaster-light'.")

(defcustom modus-alabaster-light-palette-overrides nil
  "Palette overrides for `modus-alabaster-light'.
Entries here take precedence over both the theme palette and
`modus-alabaster-common-palette-overrides'.
See `modus-themes-common-palette-overrides' for the format."
  :group 'modus-alabaster
  :type '(repeat (list symbol (choice symbol string))))

;; Alabaster deliberately avoids bold and italic syntax.  Matching brackets
;; use the upstream active foreground and underline, not a filled background.
(defconst modus-alabaster-light-custom-faces
  '(
    '(modus-themes-bold ((t (:weight normal))))
    '(modus-themes-slant ((t (:slant normal))))
    '(show-paren-match
      ((t (:foreground "#007ACC" :background unspecified :underline t))))
    '(show-paren-match-expression
      ((t (:foreground "#007ACC" :background unspecified :underline t))))
    '(font-lock-warning-face
      ((t (:foreground "#AA3731" :background "#E8D1CF" :weight normal)))))
  "Custom face specifications for `modus-alabaster-light'.")

;;;###theme-autoload
(modus-themes-theme
 'modus-alabaster-light
 'modus-alabaster
 "Alabaster light palette on modus-operandi."
 'light
 'modus-themes-operandi-palette
 'modus-alabaster-light-palette
 'modus-alabaster-light-palette-overrides
 'modus-alabaster-light-custom-faces)

(provide-theme 'modus-alabaster-light)
;;; modus-alabaster-light.el ends here
