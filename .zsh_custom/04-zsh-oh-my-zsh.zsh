# --- Oh My Zsh Core Configuration ---

# Path to your Oh My Zsh installation
if [ -d "$HOME/.oh-my-zsh" ]; then
  export ZSH="$HOME/.oh-my-zsh"

  # Disable theme lookup (we'll source Powerlevel10k manually)
  ZSH_THEME=""

  # Plugins (safe defaults)
  plugins=(git)

  # Load Oh My Zsh
  source $ZSH/oh-my-zsh.sh

  # --- Powerlevel10k Theme (Homebrew install) ---
  if [ -f "/usr/local/share/powerlevel10k/powerlevel10k.zsh-theme" ]; then
    source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
  else
    echo "⚠️  Powerlevel10k not found at /usr/local/share/powerlevel10k/"
  fi
else
  echo "⚠️  Oh My Zsh not found at $HOME/.oh-my-zsh"
fi
