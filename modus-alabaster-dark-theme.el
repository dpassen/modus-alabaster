;;; modus-alabaster-dark.el --- Alabaster dark on modus-vivendi -*- lexical-binding: t -*-

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

(defconst modus-alabaster-dark-palette
  (modus-themes-generate-palette
   '(
     ;; Upstream globals.  #1D2324 is #ffffff10 composited over #0E1415.
     (bg-main      "#0E1415")
     (bg-dim       "#1D2324") ; line_highlight
     (bg-active    "#293334") ; selection
     (bg-inactive  "#293334")
     (border       "#708B8D")
     (fringe       "#0E1415")
     (fg-main      "#CECECE")
     (fg-dim       "#708B8D")
     (fg-alt       "#AAAAAA")
     (cursor       "#CD974B")

     ;; The four syntax classes, plus punctuation and interaction.
     (alabaster-comment     "#DFDF8E")
     (alabaster-string      "#95CB82")
     (alabaster-constant    "#CC8BC9")
     (alabaster-definition  "#71ADE7")
     (alabaster-escape      "#CECECE")
     (alabaster-punctuation "#708B8D")
     (alabaster-operator    "#708B8D")
     (alabaster-bracket     "#CECECE")
     (alabaster-active      "#CD974B")
     (alabaster-error       "#CC3333")
     (alabaster-misspelling "#FF0000")
     (alabaster-search-fg   "#000000")

     ;; Modus accent vocabulary, restricted to upstream colours.
     (red          "#CC3333")
     (red-warmer   "#CC3333")
     (red-cooler   "#CC3333")
     (red-faint    "#CC3333")
     (red-intense  "#CC3333")
     (green        "#95CB82")
     (green-warmer "#95CB82")
     (green-cooler "#95CB82")
     (green-faint  "#95CB82")
     (green-intense "#95CB82")
     (yellow        "#DFDF8E")
     (yellow-warmer "#DFDF8E")
     (yellow-cooler "#DFDF8E")
     (yellow-faint  "#DFDF8E")
     (yellow-intense "#DFDF8E")
     (blue         "#71ADE7")
     (blue-warmer  "#71ADE7")
     (blue-cooler  "#71ADE7")
     (blue-faint   "#71ADE7")
     (blue-intense "#71ADE7")
     (magenta         "#CC8BC9")
     (magenta-warmer  "#CC8BC9")
     (magenta-cooler  "#CC8BC9")
     (magenta-faint   "#CC8BC9")
     (magenta-intense "#CC8BC9")
     (cyan         "#CD974B")
     (cyan-warmer  "#CD974B")
     (cyan-cooler  "#CD974B")
     (cyan-faint   "#CD974B")
     (cyan-intense "#CD974B")
     (rust   "#CD974B")
     (gold   "#CD974B")
     (olive  "#95CB82")
     (slate  "#71ADE7")
     (indigo "#CC8BC9")
     (maroon "#CC3333")
     (pink   "#CC8BC9")

     ;; Upstream's invalid-token background and otherwise plain surfaces.
     (bg-red-intense "#2B1D1E")
     (bg-red-subtle  "#2B1D1E")
     (bg-red-nuanced "#2B1D1E")
     (bg-green-intense   "#0E1415")
     (bg-green-subtle    "#0E1415")
     (bg-green-nuanced   "#0E1415")
     (bg-yellow-intense  "#0E1415")
     (bg-yellow-subtle   "#0E1415")
     (bg-yellow-nuanced  "#0E1415")
     (bg-blue-intense    "#0E1415")
     (bg-blue-subtle     "#0E1415")
     (bg-blue-nuanced    "#0E1415")
     (bg-magenta-intense "#0E1415")
     (bg-magenta-subtle  "#0E1415")
     (bg-magenta-nuanced "#0E1415")
     (bg-cyan-intense    "#0E1415")
     (bg-cyan-subtle     "#0E1415")
     (bg-cyan-nuanced    "#0E1415")

     ;; Thematic and graph slots use only colours present upstream.
     (bg-clay     "#0E1415")
     (fg-clay     "#CC3333")
     (bg-ochre    "#0E1415")
     (fg-ochre    "#CD974B")
     (bg-lavender "#0E1415")
     (fg-lavender "#CC8BC9")
     (bg-sage     "#0E1415")
     (fg-sage     "#95CB82")
     (bg-graph-red-0     "#D2322D")
     (bg-graph-red-1     "#D2322D")
     (bg-graph-green-0   "#6ABF40")
     (bg-graph-green-1   "#6ABF40")
     (bg-graph-yellow-0  "#EC8013")
     (bg-graph-yellow-1  "#EC8013")
     (bg-graph-blue-0    "#71ADE7")
     (bg-graph-blue-1    "#71ADE7")
     (bg-graph-magenta-0 "#CC8BC9")
     (bg-graph-magenta-1 "#CC8BC9")
     (bg-graph-cyan-0    "#CD974B")
     (bg-graph-cyan-1    "#CD974B")

     ;; Editor chrome.
     (bg-completion      "#293334")
     (bg-popup           "#0E1415")
     (bg-hover           "#293334")
     (bg-hover-secondary "#1D2324")
     (bg-hl-line         "#1D2324")
     (bg-region          "#293334")
     (fg-region          "#CECECE")
     (bg-mode-line-active       "#293334")
     (fg-mode-line-active       "#CECECE")
     (border-mode-line-active   "#708B8D")
     (bg-mode-line-inactive     "#1D2324")
     (fg-mode-line-inactive     "#708B8D")
     (border-mode-line-inactive "#293334")
     (modeline-err     "#CC3333")
     (modeline-warning "#CC3333")
     (modeline-info    "#CD974B")
     (bg-tab-bar     "#1D2324")
     (bg-tab-current "#0E1415")
     (bg-tab-other   "#293334")
     (fg-line-number-inactive "#708B8D")
     (fg-line-number-active   "#CECECE")
     (bg-line-number-inactive "#0E1415")
     (bg-line-number-active   "#1D2324")

     ;; Upstream diff colours are HSL values, represented exactly in RGB.
     (bg-added         "#0E1415")
     (bg-added-faint   "#0E1415")
     (bg-added-refine  "#0E1415")
     (bg-added-fringe  "#6ABF40")
     (fg-added         "#6ABF40")
     (fg-added-intense "#6ABF40")
     (bg-removed         "#0E1415")
     (bg-removed-faint   "#0E1415")
     (bg-removed-refine  "#0E1415")
     (bg-removed-fringe  "#D2322D")
     (fg-removed         "#D2322D")
     (fg-removed-intense "#D2322D")
     (bg-changed         "#0E1415")
     (bg-changed-faint   "#0E1415")
     (bg-changed-refine  "#0E1415")
     (bg-changed-fringe  "#EC8013")
     (fg-changed         "#EC8013")
     (fg-changed-intense "#EC8013")
     (bg-diff-context "#0E1415")

     ;; Search, bracket matching, and prose blocks.
     (bg-search-current    "#CD974B")
     (bg-search-lazy       "#CD974B")
     (bg-search-static     "#CD974B")
     (bg-search-replace    "#CD974B")
     (bg-search-rx-group-0 "#CD974B")
     (bg-search-rx-group-1 "#CD974B")
     (bg-search-rx-group-2 "#CD974B")
     (bg-search-rx-group-3 "#CD974B")
     (bg-paren-match      "#0E1415")
     (bg-paren-expression "#0E1415")
     (fg-paren-match      "#CECECE")
     (bg-prose-block-delimiter "#1D2324")
     (fg-prose-block-delimiter "#CECECE")
     (bg-prose-block-contents  "#1D2324")

     ;; Terminal endpoints.
     (bg-term-black        "#0E1415")
     (fg-term-black        "#0E1415")
     (bg-term-black-bright "#708B8D")
     (fg-term-black-bright "#708B8D")
     (bg-term-white        "#AAAAAA")
     (fg-term-white        "#AAAAAA")
     (bg-term-white-bright "#CECECE")
     (fg-term-white-bright "#CECECE"))
   nil
   modus-themes-vivendi-palette
   modus-alabaster-common-palette-mappings)
  "Full palette for `modus-alabaster-dark'.")

(defcustom modus-alabaster-dark-palette-overrides nil
  "Palette overrides for `modus-alabaster-dark'.
Entries here take precedence over both the theme palette and
`modus-alabaster-common-palette-overrides'.
See `modus-themes-common-palette-overrides' for the format."
  :group 'modus-alabaster
  :type '(repeat (list symbol (choice symbol string))))

;; Alabaster deliberately avoids bold and italic syntax.  The dark scheme
;; keeps matching brackets at the normal foreground and underlines them with
;; its active colour.  Regex escapes receive the upstream translucent fill.
(defconst modus-alabaster-dark-custom-faces
  '(
    '(modus-themes-bold ((t (:weight normal))))
    '(modus-themes-slant ((t (:slant normal))))
    '(show-paren-match
      ((t (:foreground "#CECECE" :background unspecified
           :underline (:color "#CD974B" :style line)))))
    '(show-paren-match-expression
      ((t (:foreground "#CECECE" :background unspecified
           :underline (:color "#CD974B" :style line)))))
    '(font-lock-regexp-grouping-backslash
      ((t (:foreground "#CECECE" :background "#1D2324" :weight normal))))
    '(font-lock-warning-face
      ((t (:foreground "#CC3333" :background "#2B1D1E" :weight normal)))))
  "Custom face specifications for `modus-alabaster-dark'.")

;;;###theme-autoload
(modus-themes-theme
 'modus-alabaster-dark
 'modus-alabaster
 "Alabaster dark palette on modus-vivendi."
 'dark
 'modus-themes-vivendi-palette
 'modus-alabaster-dark-palette
 'modus-alabaster-dark-palette-overrides
 'modus-alabaster-dark-custom-faces)

(provide-theme 'modus-alabaster-dark)
;;; modus-alabaster-dark.el ends here
