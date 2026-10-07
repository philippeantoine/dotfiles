#!/usr/bin/env zsh
# checklist — Minimal TDD diagnostic for local dotfiles

NEXT=""

check() {
  local name="$1" cond="$2" fix="$3"
  if eval "$cond" &>/dev/null; then
    echo "✅ $name"
  else
    echo "❌ $name"
    [[ -z "$NEXT" ]] && NEXT="$name|$fix"
  fi
}

echo "📋 Dotfiles Checklist ($(hostname -s))\n"

# 1. Core tools
check "Homebrew installed"      'command -v brew'                        'Install Homebrew (https://brew.sh)'
check "Chezmoi installed"       'command -v chezmoi'                     'Add brew "chezmoi" to Brewfile && brew bundle'
check "Brewfile synced"         'brew bundle check --file=./Brewfile'    'Run: brew bundle --file=./Brewfile'

# 2. Config files ($HOME & ~/.config)
check "~/.zshrc active"         '[[ -f ~/.zshrc ]] && grep -q "mise activate" ~/.zshrc' 'Apply dot_zshrc via chezmoi'
check "~/.gitconfig configured" '[[ -f ~/.gitconfig ]] && git config --global user.email' 'Create & apply dot_gitconfig via chezmoi'
check "Mise config (~/.config)" '[[ -f ~/.config/mise/config.toml ]]'    'Link/apply ~/.config/mise/config.toml'
check "Starship (~/.config)"    '[[ -f ~/.config/starship.toml ]]'       'Link/apply ~/.config/starship.toml'
check "Ghostty (~/.config)"     '[[ -f ~/.config/ghostty/config ]]'      'Link/apply ~/.config/ghostty/config'
check "Zed (~/.config)"         '[[ -f ~/.config/zed/settings.json ]]'   'Link/apply ~/.config/zed/settings.json'

# 3. Runtimes & Work isolation
check "Mise runtimes ready"     'mise ls --current | grep -q python'     'Run: mise install'
check "Work env isolated"       '! grep -qi "googlers" .zshrc && [[ -d work ]]' 'Move work aliases/scripts into work/'

echo ""
if [[ -n "$NEXT" ]]; then
  echo "🎯 NEXT STEP: ${NEXT%|*}"
  echo "👉 Action:    ${NEXT#*|}"
  exit 1
else
  echo "🎉 All checks passed! Ready to commit."
fi
