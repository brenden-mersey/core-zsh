# --- Oh My Zsh Core Configuration ---

# Ensure Oh My Zsh exists
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "⚠️  Oh My Zsh not found at $HOME/.oh-my-zsh"
  return
fi

export ZSH="$HOME/.oh-my-zsh"

# Disable automatic theme lookup — we'll load Powerlevel10k manually
ZSH_THEME=""

# --- Load Oh My Zsh ---
source "$ZSH/oh-my-zsh.sh"

# ==========================================================
#          Homebrew & Powerlevel10k Bootstrap
# ==========================================================

# 1. Check if Homebrew exists
if ! command -v brew >/dev/null 2>&1; then
  echo "⚠️  Homebrew is not installed. Powerlevel10k cannot be auto-loaded."
  echo "➡️  Install Homebrew with:"
  echo ""
  echo '    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  echo ""
  return
fi

# 2. Detect Homebrew prefix (Intel = /usr/local, Apple Silicon = /opt/homebrew)
BREW_PREFIX="$(brew --prefix 2>/dev/null)"

# 3. Auto-install Powerlevel10k if missing
if ! brew list | grep -q "^powerlevel10k$"; then
  echo "🔧  Powerlevel10k not found — installing via Homebrew..."
  brew install powerlevel10k
fi

# 4. Load Powerlevel10k theme from correct location
P10K_THEME="$BREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"

if [ -f "$P10K_THEME" ]; then
  source "$P10K_THEME"
else
  echo "⚠️  Powerlevel10k theme file not found at:"
  echo "   $P10K_THEME"
fi
