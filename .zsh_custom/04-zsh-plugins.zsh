# --- Zsh Plugins Module ---
# Provides smart completions, syntax highlighting, suggestions, and quality-of-life utilities.

# --- Auto-install helper ---
ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

install_plugin() {
  local repo=$1
  local folder=$2
  if [ ! -d "$ZSH_CUSTOM_DIR/plugins/$folder" ]; then
    echo "🔧  Installing $folder..."
    git clone --depth=1 "$repo" "$ZSH_CUSTOM_DIR/plugins/$folder" >/dev/null 2>&1
  fi
}

# --- Core zsh-users plugins ---
install_plugin "https://github.com/zsh-users/zsh-autosuggestions" "zsh-autosuggestions"
install_plugin "https://github.com/zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting"
install_plugin "https://github.com/zsh-users/zsh-completions" "zsh-completions"

# --- Enable plugins (Oh My Zsh will load them) ---
plugins=(
  git
  z                     # jump between frequently-used directories
  extract               # extract archives of any type
  colored-man-pages     # colorized man-page output
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

# --- Initialize completions if not already loaded ---
autoload -Uz compinit && compinit -C
