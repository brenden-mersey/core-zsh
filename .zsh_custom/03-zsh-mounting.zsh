# --- Mounting & Navigation ---

projects() {
  if [[ -d "$CLIENTS_DIR" ]]; then
    cd "$CLIENTS_DIR" || return
  else
    printf "⚠️  Drive not mounted 😕\n"
    return 1
  fi
}

# -- Jump to Work directory
cd-work() {
  if [[ -d "$CLIENTS_DIR" ]]; then
    cd "$CLIENTS_DIR" || return
  else
    echo "Work directory not found. Is the drive mounted?"
    return 1
  fi
}

# -- Jump to Aurora Medical Cannabis Inc. project directory
cd-aurora() {
  local dir="$CLIENTS_DIR/Aurora Medical Cannabis Inc."
  if [[ -d "$dir" ]]; then
    cd "$dir" || return
  else
    echo "Aurora directory not found. Is the drive mounted?"
    return 1
  fi
}
