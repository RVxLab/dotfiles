# My macOS and Linux Dotfiles

> ⚠ Migrated to [Forgejo](https://code.rvx.works/RVxLab/dotfiles).

## Installation

Clone this repo to `$HOME/.dotfiles`:

```shell
git clone git@github.com:RVxLab/dotfiles "$HOME/.dotfiles"
```

If [just](https://just.systems) is installed, you can run the following command to install relevant systems:

```shell
just install
```

Otherwise, run the relavant scripts by hand:

```shell
# For macOS
bash ./install-macos.sh
brew bundle install --file "$HOME/.dotfiles/Brewfile"

# For Linux
# TODO
```
