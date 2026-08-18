# --- Git Aliases & Functions ---

# Clear potential conflicts from git plugin
unalias gs 2>/dev/null
unalias ga 2>/dev/null
unalias gcm 2>/dev/null
unalias glog 2>/dev/null
unalias git-latest 2>/dev/null

# -- Git Status
alias gs='git status'

# -- Git Commit
gcm() {
  if [[ -z "$1" ]]; then
    echo "❗️Usage: gcm \"commit message\""
    return 1
  fi
  git commit -m "$1"
}

# -- Git Add (defaults to all)
ga() {
  git add "${@:-.}"
}

# -- Git Log (latest 10 by default)
glog() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not a git repository."
    return 1
  }
  git log --graph --decorate -n "${1:-10}" --format="%h %s (%an)"
}

# -- Show current Bitbucket identity
bb-me() {
  echo "--- git identity ---"
  echo "  name:  $(git config --global user.name)"
  echo "  email: $(git config --global user.email)"
  echo "--- bitbucket ssh routing ---"
  git config --global --get-regexp "url\." 2>/dev/null | grep bitbucket | awk '{print "  " $2 " -> " $1}' || echo "  (no url rewrite active)"
}

# -- Git Latest (branch comparison or chronological)
git-latest() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not a git repository."
    return 1
  }

  if [[ -n "$1" ]]; then
    local target="$1"
    echo "⚖️  Comparing all local branches against '$target'..."
    echo "────────────────────────────────────────────"

    git for-each-ref --format='%(refname:short)' refs/heads/ | while IFS= read -r branch; do
      [[ "$branch" == "$target" ]] && continue

      local ahead_behind ahead behind
      ahead_behind=$(git rev-list --left-right --count "$branch...$target" 2>/dev/null) || continue
      ahead="${ahead_behind%% *}"
      behind="${ahead_behind##* }"

      # Sort by ahead count (hidden field), then print pretty output
      printf "%s\t%-30s ⏫ %s ahead  ⏬ %s behind\n" "$ahead" "$branch" "$ahead" "$behind"
    done | sort -t $'\t' -k1,1nr | cut -f2-
  else
    echo "🧭 Latest local branches (by commit date):"
    git for-each-ref --sort=-committerdate refs/heads/ \
      --format='%(color:yellow)%(refname:short)%(color:reset) - %(color:green)%(committerdate:relative)%(color:reset)'
  fi
}

# -- Show current GitHub account and identity
gh-me() {
  echo "--- gh active account ---"
  gh auth status | grep -E "Active account: true|Logged in" | head -2
  echo "--- git identity ---"
  echo "  name:  $(git config --global user.name)"
  echo "  email: $(git config --global user.email)"
}

# -- Show full identity and SSH host summary
me() {
  echo "--- gh active account ---"
  gh auth status 2>&1 | grep -E "Logged in|Active account" | head -2
  echo "--- git identity ---"
  echo "  name:  $(git config --global user.name)"
  echo "  email: $(git config --global user.email)"
  echo "--- ssh hosts ---"
  awk '/^Host /{host=$2} /HostName/{hn=$2} /IdentityFile/{split($2,a,"/"); key=a[length(a)]; printf "  %-24s %-15s %s\n", host, hn, key}' ~/.ssh/config
}

# -- Compare directories using difftool
dirdelta() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: dirdelta <directory_A> <directory_B>"
    return 1
  fi

  local dirA="$1"
  local dirB="$2"

  [[ -d "$dirA" ]] || { echo "Error: '$dirA' is not a directory."; return 1; }
  [[ -d "$dirB" ]] || { echo "Error: '$dirB' is not a directory."; return 1; }

  echo "Running dirdelta comparison..."
  echo "A (source): $dirA"
  echo "B (target): $dirB"
  echo ""

  git difftool --no-index "$dirA" "$dirB"
}
