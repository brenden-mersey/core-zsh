# --- Zsh Plugins Module (Oh My Zsh) ---

[[ -o interactive ]] || return
command -v git >/dev/null 2>&1 || return

ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

install_plugin() {
  local repo="$1"
  local folder="$2"
  local dest="$ZSH_CUSTOM_DIR/plugins/$folder"

  if [[ ! -d "$dest" ]]; then
    echo "🔧  Installing $folder..."
    git clone --depth=1 "$repo" "$dest" >/dev/null 2>&1 || {
      echo "⚠️  Failed to install $folder"
      return 1
    }
  fi
}

# --- Core zsh-users plugins ---
install_plugin "https://github.com/zsh-users/zsh-autosuggestions" "zsh-autosuggestions"
install_plugin "https://github.com/zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting"
install_plugin "https://github.com/zsh-users/zsh-completions" "zsh-completions"

# --- Enable plugins (Oh My Zsh will load them) ---
plugins=(
  git
  z
  extract
  colored-man-pages
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)
