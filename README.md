# Modus Alabaster

Themes for [GNU Emacs](https://www.gnu.org/software/emacs/) based exclusively
on Niki Tonsky’s [Alabaster color schemes](https://github.com/tonsky/sublime-scheme-alabaster),
built on top of [modus-themes](https://protesilaos.com/emacs/modus-themes).

## Installation

```elisp
(use-package modus-alabaster
  :vc (:url "https://github.com/dpassen/modus-alabaster"
       :rev :newest)
  :config
  (load-theme 'modus-alabaster-light :no-confirm))
```

## Diff backgrounds

Like upstream Alabaster, diffs are styled by foreground colour, and only the
hunk at point (e.g. in Magit) gets a subtle background. To tint every added,
removed and changed line, override the `-faint` palette slots before loading
the theme:

```elisp
(use-package modus-alabaster
  :custom
  (modus-alabaster-light-palette-overrides
   '((bg-added-faint   "#E5ECE2")
     (bg-removed-faint "#EFE4E3")
     (bg-changed-faint "#F8F1E8")))
  (modus-alabaster-dark-palette-overrides
   '((bg-added-faint   "#1C2620")
     (bg-removed-faint "#211718")
     (bg-changed-faint "#232821"))))
```

The same values work with `setopt`. Reload the theme afterwards if it is
already active.

## Screenshots

### Alabaster Light

![Alabaster Light](/screenshots/modus-alabaster-light.png)

### Alabaster Dark

![Alabaster Dark](/screenshots/modus-alabaster-dark.png)
