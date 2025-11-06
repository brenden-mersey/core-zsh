# core-zsh

Modular Zsh configuration for a clean, maintainable, and portable shell environment.  
Includes foundational aliases, functions, and preferences used across all development projects.

---

## 🧩 Structure

| Module              | Description                                                                              |
| :------------------ | :--------------------------------------------------------------------------------------- |
| `zsh-core.zsh`      | Global environment variables, PATH configuration, completion, and general shell options. |
| `zsh-oh-my-zsh.zsh` | Oh My Zsh initialization, theme, and plugin setup.                                       |
| `zsh-github.zsh`    | Git helpers, aliases, and workflow utilities.                                            |
| `zsh-mounting.zsh`  | Mount and directory shortcuts (e.g., `$CLIENTS_DIR` for external drives).                |

---

## ⚙️ Setup

1. **Clone this repository:**

```bash
git clone https://github.com/brenden-mersey/core-zsh.git ~/.zsh_custom_repo
```

2. **Copy or symlink the configuration:**

```bash
ln -s ~/.zsh_custom_repo/.zshrc ~/.zshrc
ln -s ~/.zsh_custom_repo/.zsh_custom ~/.zsh_custom
```

3. **Reload your shell:**

```bash
source ~/.zshrc
```
