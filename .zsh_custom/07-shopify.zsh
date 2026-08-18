# Generic Shopify theme shortcuts
# Reads .local.shopify from the current project directory.
# Usage: shopify-theme [dev|push|pull|sandbox]
#
# Supports multi-store format (STORE_* + ACTIVE_STORE) and falls back
# to the legacy single-variable format (STORE="...") for older projects.
#
# 'sandbox' starts a preview against a disposable personal development theme
# instead of ACTIVE_THEME, safe to use without touching any real theme.

# Prints a rounded, colored box in the same style as the Shopify CLI's own
# output boxes, used to surface the store/theme context before a command runs.
# Usage: _shopify_theme_box "title" "line one" "line two" ...
_shopify_theme_box() {
  local title="$1"; shift
  local -a body=("$@")

  local color=$'\e[38;5;199m' # neon pink, distinct from the CLI's own green success boxes
  local reset=$'\e[0m'
  local h_pad=2
  local v_pad=1
  local fixed_width=124 # adjust this to resize the box

  local content_width=${#title}
  local line
  for line in "${body[@]}"; do
    (( ${#line} > content_width )) && content_width=${#line}
  done

  # Use fixed_width unless the content is too long to fit, then grow just
  # enough to avoid clipping.
  local box_width=$fixed_width
  local min_box_width=$(( content_width + h_pad * 2 ))
  (( box_width < min_box_width )) && box_width=$min_box_width

  local title_segment="─ ${title} "
  local dash_count=$(( box_width - ${#title_segment} ))
  (( dash_count < 1 )) && dash_count=1

  local h_spaces=${(l:$h_pad:: :)}
  local blank_line="${color}│${reset}${(l:$box_width:: :)}${color}│${reset}"

  print -- "${color}╭─ ${reset}${title}${color} ${(l:$dash_count::─:)}╮${reset}"
  for (( i = 1; i <= v_pad; i++ )); do
    print -- "$blank_line"
  done
  for line in "${body[@]}"; do
    local pad=$(( box_width - h_pad - ${#line} ))
    print -- "${color}│${h_spaces}${reset}${line}${(l:$pad:: :)}${color}│${reset}"
  done
  for (( i = 1; i <= v_pad; i++ )); do
    print -- "$blank_line"
  done
  print -- "${color}╰${(l:$box_width::─:)}╯${reset}"
}

shopify-theme() {
  local config=".local.shopify"

  if [[ ! -f "$config" ]]; then
    echo "Error: No $config file found in the current directory."
    echo "Create one with STORE_*, THEME_*, ACTIVE_STORE, and ACTIVE_THEME defined."
    return 1
  fi

  source "$config"

  local store_label="${ACTIVE_STORE:-STORE}"
  local store_url="${(P)ACTIVE_STORE:-$STORE}"
  local theme_id="${(P)ACTIVE_THEME}"

  if [[ -z "$store_url" ]]; then
    echo "Error: ACTIVE_STORE (or legacy STORE) must be set in $config."
    return 1
  fi

  case "$1" in
    dev|push|pull)
      if [[ -z "$theme_id" ]]; then
        echo "Error: ACTIVE_THEME must be set in $config for '$1'."
        return 1
      fi
      _shopify_theme_box "shopify-theme" "Store: $store_label ($store_url)" "Theme: $ACTIVE_THEME ($theme_id)"
      shopify theme "$1" --store "$store_url" --theme "$theme_id" ;;
    sandbox)
      _shopify_theme_box "shopify-theme" "Store: $store_label ($store_url)" "Theme: sandbox (disposable personal development theme, no theme ID from $config)"
      shopify theme dev --store "$store_url" ;;
    *)
      echo "Usage: shopify-theme [dev|push|pull|sandbox]"
      echo "  dev      Start local preview against the active theme (ACTIVE_THEME in $config)"
      echo "  push     Push local changes to the active theme"
      echo "  pull     Pull content editor changes back to local"
      echo "  sandbox  Start local preview against a disposable personal development theme,"
      echo "           doesn't touch ACTIVE_THEME or any other existing theme"
      echo ""
      echo "Active store: ${ACTIVE_STORE:-STORE} ($store_url)"
      echo "Active theme: $ACTIVE_THEME ($theme_id)"
      ;;
  esac
}
