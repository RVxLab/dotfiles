# Common tasks to manage my dotfiles

## stow

> Set up all symlinks in the ./dotfiles directory

```bash
set -euo pipefail

DIRECTORIES="$(find ./dotfiles -type d -depth 1 | sort | xargs basename | paste -sd ' ' -)"

stow -R -d "$HOME/.dotfiles/dotfiles" -t "$HOME" $DIRECTORIES

```
