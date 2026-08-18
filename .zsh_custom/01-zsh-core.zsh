# --- Zsh Core Configuration ---

# Prefer UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# --- Clients directory (external drive fallback) ---
if [[ -d "/Volumes/Mersey5TB/Work" ]]; then
  export CLIENTS_DIR="/Volumes/Mersey5TB/Work"
else
  export CLIENTS_DIR="$HOME/Documents/Work"
fi

# --- OpenJDK PATH (prefer Apple Silicon Homebrew) ---
if [[ -x "/opt/homebrew/opt/openjdk/bin/java" ]]; then
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
elif [[ -x "/usr/local/opt/openjdk/bin/java" ]]; then
  export PATH="/usr/local/opt/openjdk/bin:$PATH"
fi

# --- Completion ---
autoload -Uz compinit
if [[ -f "$HOME/.zcompdump" ]]; then
  compinit -C
else
  compinit
fi

setopt COMPLETE_ALIASES
setopt AUTO_CD HIST_IGNORE_DUPS HIST_IGNORE_SPACE INTERACTIVE_COMMENTS
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT

# --- History ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# --- Editor shortcuts ---
alias vscode='code'
command -v cursor >/dev/null 2>&1 || alias cursor="/Applications/Cursor.app/Contents/Resources/app/bin/cursor"

# --- Prompt (optional) ---
PROMPT='%F{green}%n@%m%f %F{blue}%1~%f %# '

# --- Reload the current terminal config ---
reset-cli() {
  echo "Reloading zsh config..."
  source "$HOME/.zshrc"
}

cli-reset() {
  reset-cli
}

# -- List all custom functions and aliases
my-functions() {
  printf "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
  printf "  Your Custom Zsh Commands\n"
  printf "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
  local desc="" name="" shown_header
  for file in ~/.zsh_custom/*.zsh; do
    shown_header=0
    desc=""
    while IFS= read -r line; do
      if [[ "$line" =~ '^# -- (.+)$' ]]; then
        desc="${match[1]}"
      elif [[ "$line" =~ '^alias ([^=[:space:]]+)=' ]]; then
        name="${match[1]}"
        [[ $shown_header -eq 0 ]] && { printf "\n  %s\n" "$(basename $file)"; shown_header=1; }
        printf "    %-28s %s\n" "$name" "${desc:-(alias)}"
        desc=""
      elif [[ "$line" =~ '^([a-zA-Z_][a-zA-Z0-9_-]*)[[:space:]]*\(\)' ]]; then
        name="${match[1]}"
        [[ $shown_header -eq 0 ]] && { printf "\n  %s\n" "$(basename $file)"; shown_header=1; }
        printf "    %-28s %s\n" "$name" "${desc:-(function)}"
        desc=""
      elif [[ -n "$line" && "$line" != \#* ]]; then
        desc=""
      fi
    done < "$file"
  done
  printf "\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
}
