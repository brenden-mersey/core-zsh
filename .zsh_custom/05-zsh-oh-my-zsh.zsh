# --- Oh My Zsh Core Configuration ---

# Only for interactive shells
[[ -o interactive ]] || return

# Ensure Oh My Zsh exists
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "⚠️  Oh My Zsh not found at $HOME/.oh-my-zsh"
  return
fi

export ZSH="$HOME/.oh-my-zsh"

# --- Homebrew bootstrap early (Intel or Apple Silicon) ---
if [[ -x "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x "/usr/local/bin/brew" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Disable Oh My Zsh theme — we'll load Powerlevel10k manually
ZSH_THEME=""

# --- Load Oh My Zsh ---
source "$ZSH/oh-my-zsh.sh"

# --- Powerlevel10k ---
# Prefer sourcing from Homebrew if installed; otherwise just skip quietly.
if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix 2>/dev/null)"
  P10K_THEME="$BREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"

  if [[ -f "$P10K_THEME" ]]; then
    source "$P10K_THEME"
  else
    # No auto-install on startup (recommended). Uncomment if you *really* want it.
    # echo "⚠️  Powerlevel10k not found. Install with: brew install powerlevel10k"
    :
  fi
fi
