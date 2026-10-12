# dotfiles

Personal macOS configuration managed with [chezmoi](https://www.chezmoi.io/).

## Quickstart

```sh
# 1. Install Homebrew & chezmoi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi

# 2. Apply dotfiles
chezmoi init --apply philippeantoine

# 3. Install dependencies & verify
brew bundle --file=~/dotfiles/Brewfile
~/dotfiles/checklist.sh
```

## Stack

- **Dotfiles**: [chezmoi](https://www.chezmoi.io/)
- **Packages**: Homebrew (`Brewfile`)
- **Shell**: Zsh + [Starship](https://starship.rs/)
- **Runtimes**: [mise](https://mise.jdx.dev/)
- **Apps**: [Ghostty](https://ghostty.org/), [Zed](https://zed.dev/)
