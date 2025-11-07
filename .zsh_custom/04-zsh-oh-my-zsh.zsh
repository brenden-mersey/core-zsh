# --- Oh My Zsh Core Configuration ---

# Path to your Oh My Zsh installation
if [ -d "$HOME/.oh-my-zsh" ]; then
  export ZSH="$HOME/.oh-my-zsh"

  # Theme
  ZSH_THEME="powerlevel10k/powerlevel10k"

  # Plugins (safe defaults)
  plugins=(git)

  # Load Oh My Zsh
  source $ZSH/oh-my-zsh.sh
else
  echo "⚠️  Oh My Zsh not found at $HOME/.oh-my-zsh"
fi
