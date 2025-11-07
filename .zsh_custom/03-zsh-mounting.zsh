# --- Mounting & Navigation ---

alias projects='[ -d "$CLIENTS_DIR" ] && cd "$CLIENTS_DIR" || printf "⚠️  Drive not mounted 😕\n"'

# Automatically navigate to CLIENTS_DIR on terminal startup if it exists
# If the directory doesn't exist, silently stay in home directory as fallback
if [ -d "$CLIENTS_DIR" ]; then
  cd "$CLIENTS_DIR" 2>/dev/null || true
fi
