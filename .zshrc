# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==========================================================
#                   ZSH MASTER CONFIG
# ==========================================================

# --- 1. Base Setup ---
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# --- 2. Load nvm (Node Version Manager) ---
export NVM_DIR="$HOME/Library/Application Support/nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# --- 3. Load All Custom Zsh Modules ---
setopt null_glob               # if no matches, expand to nothing
zsh_custom_files=()

if [[ -d ~/.zsh_custom ]]; then
  zsh_custom_files=(~/.zsh_custom/*.zsh)
  for config_file in $zsh_custom_files; do
    [[ -f "$config_file" ]] && source "$config_file"
  done
fi

# --- 4. Optional Local Overrides ---
[[ -f "$HOME/.zsh_local" ]] && source "$HOME/.zsh_local"

# --- 5. Quality-of-life ---

# Silence “Last login” message (macOS)
# Create .hushlogin if it doesn't exist to suppress login messages
touch "$HOME/.hushlogin" 2>/dev/null

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. "$HOME/.local/bin/env"
