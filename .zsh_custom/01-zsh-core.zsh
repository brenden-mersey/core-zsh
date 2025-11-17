# --- Zsh Core Configuration ---
# This file initializes global settings and environment variables
# used across all custom modules.

# --- External Drive Path (global reference) ---
# CLIENTS_DIR="/Users/brendenmersey/Documents/Clients" (Laptop-specific)
CLIENTS_DIR="/Volumes/Mersey 5TB/Clients"

# --- Path Configuration ---
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# --- Autocomplete & Shell Options ---
autoload -Uz compinit
# Use a fast rehash only if completion files exist
if [ -d "$HOME/.zcompdump" ]; then
  compinit -C
else
  compinit
fi

# Allow aliases to expand during completion
setopt COMPLETE_ALIASES

# Improve shell experience
setopt AUTO_CD          # cd by just typing directory name
setopt HIST_IGNORE_DUPS # no duplicate commands in history
setopt HIST_IGNORE_SPACE # ignore commands starting with a space
setopt INTERACTIVE_COMMENTS # allow comments in the command line
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT # nicer directory navigation

# --- History Settings ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# --- Editor Shortcuts ---
alias vscode='code'
alias cursor='/Applications/Cursor.app/Contents/Resources/app/bin/cursor'

# --- Prompt tweaks ---
PROMPT='%F{green}%n@%m%f %F{blue}%1~%f %# '

# --- Startup message (optional) ---
echo "🪴  Zsh core loaded — Starting up the CLI to:"
echo "    $CLIENTS_DIR"