# core-zsh

Modular Zsh configuration for a clean, maintainable, and portable shell environment.  
Includes foundational aliases, functions, and preferences used across all development projects.

---

## 🧩 Structure

| File                    | Description                                                                                  |
| :----------------------- | :-------------------------------------------------------------------------------------------- |
| `.zshrc`                 | Master config. Bootstraps the shell and sources every module in `.zsh_custom/`.               |
| `.p10k.zsh`               | Powerlevel10k prompt config, standard location, sourced directly by `.zshrc` (not part of the numbered module set below, order doesn't apply to it). |
| `01-zsh-core.zsh`        | Global environment variables, PATH configuration, completion, and general shell options.      |
| `02-zsh-git.zsh`         | Git helpers and aliases, plus `gh-*`/`bb-*` identity switchers for jumping between GitHub and Bitbucket accounts (e.g. `gh-daymarker`, `gh-aurora`). |
| `03-zsh-mounting.zsh`    | Directory shortcuts (e.g. `$CLIENTS_DIR`, `cd-work`, `cd-aurora`).                             |
| `04-zsh-plugins.zsh`     | Oh My Zsh plugin auto-install and setup (`z`, `extract`, `zsh-autosuggestions`, etc.).         |
| `05-zsh-oh-my-zsh.zsh`   | Oh My Zsh + Homebrew bootstrap, Powerlevel10k theme loading.                                   |
| `06-daymarker-tools.zsh` | **Gitignored, not in this repo.** Daymarker-specific PATH and Harvest API credentials. Recreate manually per machine if needed, never commit the real file (see `.gitignore`). |
| `07-shopify.zsh`         | `shopify-theme` wrapper (`dev`/`push`/`pull`/`sandbox`), reads `.local.shopify` from the current project directory. |

Modules in `.zsh_custom/` are loaded alphabetically by `.zshrc`, hence the numeric prefixes, they control load order for files that have real ordering dependencies (env vars before Homebrew bootstrap, etc.). `.p10k.zsh` isn't part of that loop; it's sourced by its own explicit line in `.zshrc` at Powerlevel10k's standard path.

---

## ⚙️ Setup

1. **Clone this repository:**

```bash
git clone https://github.com/brenden-mersey/core-zsh.git ~/.zsh_custom_repo
```

2. **Symlink the configuration:**

```bash
ln -s ~/.zsh_custom_repo/.zshrc ~/.zshrc
ln -s ~/.zsh_custom_repo/.zsh_custom ~/.zsh_custom
ln -s ~/.zsh_custom_repo/.p10k.zsh ~/.p10k.zsh
```

3. **Recreate any gitignored, machine/client-specific modules** (currently just `06-daymarker-tools.zsh`) directly in `~/.zsh_custom/`, not in the repo.

4. **Reload your shell:**

```bash
source ~/.zshrc
```
