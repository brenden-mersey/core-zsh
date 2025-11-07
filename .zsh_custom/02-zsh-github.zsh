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
  if [ -z "$1" ]; then
    echo "❗️Usage: gcm \"commit message\""
    return 1
  fi
  git commit -m "$1"
}

# -- Git Add All
ga() {
  git add .
}

# -- Git Log (latest 10 by default)
glog() {
  git log --oneline --graph --decorate -n "${1:-10}" --format="%h %s (%an)"
}

# -- Git Latest (branch comparison or chronological)
git-latest() {
  if [ -n "$1" ]; then
    local target="$1"
    echo "⚖️  Comparing all local branches against '$target'..."
    echo "────────────────────────────────────────────"
    for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
      if [ "$branch" != "$target" ]; then
        ahead_behind=$(git rev-list --left-right --count "$branch...$target" 2>/dev/null)
        ahead=$(echo $ahead_behind | awk '{print $1}')
        behind=$(echo $ahead_behind | awk '{print $2}')
        printf "%-30s ⏫ %2s ahead  ⏬ %2s behind\n" "$branch" "$ahead" "$behind"
      fi
    done | sort -k5 -nr
  else
    echo "🧭 Latest local branches (by commit date):"
    git for-each-ref --sort=-committerdate refs/heads/ \
      --format='%(color:yellow)%(refname:short)%(color:reset) - %(color:green)%(committerdate:relative)%(color:reset)'
  fi
}
