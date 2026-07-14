;;; modus-alabaster.el --- Alabaster colours on top of Modus themes -*- lexical-binding: t -*-

;; Copyright (C) 2026 Free Software Foundation, Inc.
;; Author: Derek Passen <dpassen1@gmail.com>
;; Maintainer: Derek Passen <dpassen1@gmail.com>
;; URL: https://github.com/dpassen/modus-alabaster
;; Version: 0.0.1
;; Based on: https://github.com/tonsky/sublime-scheme-alabaster
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))
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

(require 'modus-themes)
(eval-when-compile (require 'subr-x))

;;;; Basics for building on top of Modus

(defgroup modus-alabaster ()
  "Alabaster colour palette on top of the Modus themes infrastructure."
  :group 'faces
  :group 'modus-themes
  :link '(info-link "(modus-alabaster) Top")
  :link '(info-link "(modus-themes) Top")
  :prefix "modus-alabaster"
  :tag "Modus Alabaster Themes")

(defconst modus-alabaster-light-themes
  '(modus-alabaster-light)
  "List of symbols with the light Modus Alabaster themes.")

(defconst modus-alabaster-dark-themes
  '(modus-alabaster-dark)
  "List of symbols with the dark Modus Alabaster themes.")

(defvaralias 'modus-alabaster-collection 'modus-alabaster-items
  "Alias of `modus-alabaster-items'.")

(defconst modus-alabaster-items
  (append modus-alabaster-light-themes modus-alabaster-dark-themes))

(defconst modus-alabaster-common-palette-mappings
  '(
    ;; Alabaster highlights only strings, statically known constants,
    ;; comments, and global definitions.  Everything else stays at the
    ;; default foreground.
    (keyword          fg-main)
    (builtin          fg-main)
    (constant         alabaster-constant)
    (string           alabaster-string)
    (docstring        alabaster-string)
    (docmarkup        alabaster-string)
    (comment          alabaster-comment)
    (fnname           alabaster-definition)
    (fnname-call      fg-main)
    (type             fg-main)
    (variable         fg-main)
    (variable-use     fg-main)
    (preprocessor     fg-main)
    (property         fg-main)
    (rx-backslash     alabaster-escape)
    (rx-construct     alabaster-string)
    (number           alabaster-constant)
    (punctuation      alabaster-punctuation)
    (operator         alabaster-operator)
    (bracket          alabaster-bracket)
    (delimiter        alabaster-punctuation)

    ;; Links and interactive elements use Alabaster's active colour.
    (fg-link                 alabaster-active)
    (underline-link          alabaster-active)
    (fg-link-symbolic        alabaster-active)
    (underline-link-symbolic alabaster-active)
    (fg-link-visited         alabaster-definition)
    (underline-link-visited  alabaster-definition)

    ;; Keep prose as quiet as ordinary syntax.
    (fg-prose-code        fg-main)
    (fg-prose-macro       fg-main)
    (fg-prose-verbatim    fg-main)
    (prose-done           fg-main)
    (prose-todo           alabaster-comment)
    (prose-tag            fg-main)
    (prose-metadata       fg-main)
    (prose-metadata-value fg-main)
    (fg-heading-0         fg-main)
    (fg-heading-1         fg-main)
    (fg-heading-2         fg-main)
    (fg-heading-3         fg-main)
    (fg-heading-4         fg-main)
    (fg-heading-5         fg-main)
    (fg-heading-6         fg-main)
    (fg-heading-7         fg-main)
    (fg-heading-8         fg-main)

    ;; Completion and prompts.
    (accent-0              alabaster-active)
    (accent-1              alabaster-definition)
    (accent-2              alabaster-string)
    (accent-3              alabaster-constant)
    (fg-completion-match-0 alabaster-active)
    (fg-completion-match-1 alabaster-definition)
    (fg-completion-match-2 alabaster-string)
    (fg-completion-match-3 alabaster-constant)
    (fg-prompt             alabaster-active)
    (fg-search-current     alabaster-search-fg)
    (fg-search-lazy        alabaster-search-fg)
    (fg-search-static      alabaster-search-fg)
    (fg-search-replace     alabaster-search-fg)
    (fg-search-rx-group-0  alabaster-search-fg)
    (fg-search-rx-group-1  alabaster-search-fg)
    (fg-search-rx-group-2  alabaster-search-fg)
    (fg-search-rx-group-3  alabaster-search-fg)

    ;; Diagnostics.  Upstream uses one mistake colour rather than a
    ;; separate error/warning/info spectrum.
    (modeline-err     alabaster-error)
    (modeline-warning alabaster-error)
    (modeline-info    alabaster-active)
    (err               alabaster-error)
    (warning           alabaster-error)
    (info              alabaster-active)
    (underline-err     alabaster-misspelling)
    (underline-warning alabaster-error)
    (underline-note    alabaster-active)

    (keybind    alabaster-active)
    (name       alabaster-definition)
    (identifier alabaster-constant)

    ;; Dates are prose unless they communicate an error.
    (date-common           fg-main)
    (date-deadline         alabaster-error)
    (date-deadline-subtle  alabaster-error)
    (date-scheduled        fg-main)
    (date-scheduled-subtle fg-main)
    (date-holiday          fg-main)
    (date-holiday-other    fg-main)
    (date-weekday          fg-main)
    (date-weekend          fg-main)

    ;; Mark and mail faces remain minimal as well.
    (bg-mark-delete bg-red-subtle)
    (fg-mark-delete alabaster-error)
    (bg-mark-select bg-region)
    (fg-mark-select fg-main)
    (bg-mark-other  bg-search-current)
    (fg-mark-other  fg-main)
    (mail-cite-0    fg-main)
    (mail-cite-1    fg-main)
    (mail-cite-2    fg-main)
    (mail-cite-3    fg-main)
    (mail-part      fg-main)
    (mail-recipient fg-main)
    (mail-subject   fg-main)
    (mail-other     fg-main))
  "Common palette mappings for the Alabaster Modus themes.")

(defcustom modus-alabaster-common-palette-overrides nil
  "Palette overrides shared by all Modus Alabaster themes.
Use this for semantic mappings that should apply to both light and
dark variants.  Per-theme overrides are preferred for colour values,
as those will differ between light and dark.

See `modus-themes-common-palette-overrides' for the format."
  :group 'modus-alabaster
  :type '(repeat (list symbol (choice symbol string))))

(defconst modus-alabaster-with-properties
  '((modus-alabaster-light modus-alabaster "Alabaster light palette on modus-operandi." light modus-themes-operandi-palette modus-alabaster-light-palette modus-alabaster-light-palette-overrides)
    (modus-alabaster-dark modus-alabaster "Alabaster dark palette on modus-vivendi." dark modus-themes-vivendi-palette modus-alabaster-dark-palette modus-alabaster-dark-palette-overrides))
  "Properties for each Modus Alabaster theme.
Each entry is a list of arguments passed to `modus-themes-declare'
and `modus-themes-register'.")

(defvar modus-alabaster--declared-p nil
  "Non-nil if Modus Alabaster themes have been declared.")

(defun modus-alabaster-declare-themes ()
  "Declare and register the Modus Alabaster themes with modus-themes."
  (unless modus-alabaster--declared-p
    (dolist (theme modus-alabaster-with-properties)
      (apply #'modus-themes-declare theme)
      (modus-themes-register (car theme)))
    (setq modus-alabaster--declared-p t)))

(modus-alabaster-declare-themes)

;;;; Limit the Modus themes to only Modus Alabaster themes

;;;###autoload
(define-minor-mode modus-alabaster-take-over-modus-themes-mode
  "When enabled, all Modus theme commands consider only Modus Alabaster themes.
Alternatively, use the dedicated commands `modus-alabaster-rotate',
`modus-alabaster-select', `modus-alabaster-load-random',
`modus-alabaster-load-random-dark',
`modus-alabaster-load-random-light',
`modus-alabaster-list-colors',
`modus-alabaster-list-colors-current'.
They are all designed to only consider Modus Alabaster themes."
  :global t
  :init-value nil)

(cl-defmethod modus-themes-get-themes (&context (modus-alabaster-take-over-modus-themes-mode (eql t)))
  "Return the Modus Alabaster themes.
Do so per `modus-alabaster-take-over-modus-themes-mode'."
  (if-let* ((themes (modus-themes-get-all-known-themes 'modus-alabaster))
            (sorted-a-z (sort themes #'string-lessp))
            (sorted-light-dark (modus-themes-sort sorted-a-z 'light)))
      sorted-light-dark
    modus-alabaster-items))

;;;; Convenience commands

;;;###autoload (autoload 'modus-alabaster-rotate "modus-alabaster")
(modus-themes-define-derivative-command modus-alabaster rotate)

;;;###autoload (autoload 'modus-alabaster-select "modus-alabaster")
(modus-themes-define-derivative-command modus-alabaster select)

;;;###autoload (autoload 'modus-alabaster-load-random "modus-alabaster")
(modus-themes-define-derivative-command modus-alabaster load-random)

;;;###autoload (autoload 'modus-alabaster-load-random-dark "modus-alabaster")
(modus-themes-define-derivative-command modus-alabaster load-random-dark)

;;;###autoload (autoload 'modus-alabaster-load-random-light "modus-alabaster")
(modus-themes-define-derivative-command modus-alabaster load-random-light)

;;;###autoload (autoload 'modus-alabaster-list-colors "modus-alabaster")
(modus-themes-define-derivative-command modus-alabaster list-colors)

;;;###autoload (autoload 'modus-alabaster-list-colors-current "modus-alabaster")
(modus-themes-define-derivative-command modus-alabaster list-colors-current)

;;;; Add themes from the package to the load path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (file-equal-p dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'modus-alabaster)
;;; modus-alabaster.el ends here
