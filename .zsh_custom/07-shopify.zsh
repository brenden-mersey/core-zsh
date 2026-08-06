# Generic Shopify theme shortcuts
# Reads .local.shopify from the current project directory.
# Usage: shopify-theme [dev|push|pull|sandbox]
#
# Supports multi-store format (STORE_* + ACTIVE_STORE) and falls back
# to the legacy single-variable format (STORE="...") for older projects.
#
# 'sandbox' starts a preview against a disposable personal development theme
# instead of ACTIVE_THEME, safe to use without touching any real theme.

shopify-theme() {
  local config=".local.shopify"

  if [[ ! -f "$config" ]]; then
    echo "Error: No $config file found in the current directory."
    echo "Create one with STORE_*, THEME_*, ACTIVE_STORE, and ACTIVE_THEME defined."
    return 1
  fi

  source "$config"

  local store_url="${(P)ACTIVE_STORE:-$STORE}"
  local theme_id="${(P)ACTIVE_THEME}"

  if [[ -z "$store_url" ]]; then
    echo "Error: ACTIVE_STORE (or legacy STORE) must be set in $config."
    return 1
  fi

  case "$1" in
    dev)
      if [[ -z "$theme_id" ]]; then
        echo "Error: ACTIVE_THEME must be set in $config for 'dev'."
        return 1
      fi
      shopify theme dev  --store "$store_url" --theme "$theme_id" ;;
    push)
      if [[ -z "$theme_id" ]]; then
        echo "Error: ACTIVE_THEME must be set in $config for 'push'."
        return 1
      fi
      shopify theme push --store "$store_url" --theme "$theme_id" ;;
    pull)
      if [[ -z "$theme_id" ]]; then
        echo "Error: ACTIVE_THEME must be set in $config for 'pull'."
        return 1
      fi
      shopify theme pull --store "$store_url" --theme "$theme_id" ;;
    sandbox) shopify theme dev --store "$store_url" ;;
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
