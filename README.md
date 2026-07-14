# Modus Alabaster

Themes for [GNU Emacs](https://www.gnu.org/software/emacs/) based exclusively
on Niki Tonsky’s [Alabaster color schemes](https://github.com/tonsky/sublime-scheme-alabaster),
built on top of [modus-themes](https://protesilaos.com/emacs/modus-themes).

## Themes

- `modus-alabaster-light`, based on upstream `Alabaster`
- `modus-alabaster-dark`, based on upstream `Alabaster Dark`

## Installation

```elisp
(use-package modus-alabaster
  :vc (:url "https://github.com/dpassen/modus-alabaster"
       :rev :newest)
  :config
  (load-theme 'modus-alabaster-light :no-confirm))
```
