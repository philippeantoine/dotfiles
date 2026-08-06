# --- PATH & Environnement ---
export PATH=/usr/local/share/npm/bin:$PATH


# --- Homebrew (Apple Silicon) ---
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --- Configuration du Prompt ---
unsetopt PROMPT_SP
PROMPT='%~ $ '

# --- NVM (Node Version Manager) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --- Fonctions personnalisées ---
# bootstrap a new project folder and open with Zed
pop() {
  mkdir "$(date +%Y-%m-%d)-$1" && cd $_
  echo "$(date '+%H:%M') START" >> devnotes.md
  zed . devnotes.md
}

# --- Plugins Oh My Zsh (si installé) ---
plugins=(git nvm)
eval "$(mise activate zsh)"
