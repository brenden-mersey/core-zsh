# ==========================================================
#                   ZSH MASTER CONFIG
# ==========================================================
# This file bootstraps your shell environment and sources
# all custom modular configs from ~/.zsh_custom/*.zsh
# ==========================================================

# --- 1. Safety & Base Setup ---
# Ensure $HOME is set
export HOME="${HOME:-/Users/$(whoami)}"

# Prefer UTF-8 for consistent encoding
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# --- 2. Load All Custom Zsh Modules ---
# Each module is self-contained and stored in ~/.zsh_custom
# They’re sourced alphabetically (core first, oh-my-zsh second, etc.)
for config_file in ~/.zsh_custom/*.zsh; do
  [ -r "$config_file" ] && source "$config_file"
done

# --- 3. Optional Local Overrides ---
# You can create ~/.zsh_local for system-specific tweaks
if [ -f "$HOME/.zsh_local" ]; then
  source "$HOME/.zsh_local"
fi

# --- 4. Final Touch ---
# Silence the “last login” message
unsetopt nomatch 2>/dev/null

# Print a friendly startup confirmation
echo ""
echo "🌙  Zsh environment initialized — modules loaded:"
for config_file in ~/.zsh_custom/*.zsh; do
  basename "$config_file" | sed 's/^/   • /'
done
echo ""