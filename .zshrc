# --- PATH & Environnement ---
export PATH=/usr/local/share/npm/bin:$PATH

# --- Fonctions personnalisées ---
# bootstrap a new project folder and open with Zed
pop() {
  mkdir "$(date +%Y-%m-%d)-$1" && cd $_
  echo "$(date '+%H:%M') START" >> devnotes.md
  zed . devnotes.md
}

# --- Plugins Oh My Zsh ---
plugins=(git)

# --- 1. Fondations (Homebrew) ---
[ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# --- 2. Toolchains (Mise) ---
eval "$(mise activate zsh)"

# --- 3. Prompt (Starship) ---
eval "$(starship init zsh)"
