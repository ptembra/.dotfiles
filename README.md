# dotfiles
My personal configuration for *most* of my workspace.

## Setup
```sh
git clone https://github.com/ptembra/.dotfiles ~/.dotfiles && ~/.dotfiles/setup.sh
```
`setup.sh` links `~/.zshenv`, sets `XDG_CONFIG_HOME` for GUI apps, installs Homebrew and the `Brewfile`, and clones TPM. It's safe to re-run. After that:
- **zsh:** antidote installs the plugins in `zsh/.zsh_plugins.txt` on the first shell
- **tmux:** press `C-a I` to install plugins
- **nvim:** lazy.nvim installs plugins, Mason installs the language servers and formatters listed in `nvim/lua/plugins/code/mason.lua`, and nvim-treesitter builds parsers

## How it's organised
`XDG_CONFIG_HOME` points at this repo, so every app's config lives here. Apps also write state here, so `.gitignore` is an allowlist: only the folders opted in at its top get committed. To track a new app, add `!/<app>/` there.

| Folder | What |
|---|---|
| `zsh` | shell config; `.zshenv` is the entry point |
| `tmux` | prefix `C-a`; `Option-h/j/k/l` switches panes; `C-a C-s` / `C-a C-r` save/restore sessions (tmux-resurrect) |
| `nvim` | Neovim (lazy.nvim, Mason, conform.nvim, nvim-treesitter) |
| `ghostty` | terminal |
| `git` | git config and global ignore |
| `atuin` | shell history (`C-r` to search) |
| `aerospace`, `yazi`, `thefuck`, `config-xpui.ini` | smaller app configs (Spicetify for the last one) |
| `Brewfile` | everything installed with Homebrew |

## To-do
- [x] Auto-install and bootstrap
- [ ] Fix Elixir in neovim config

## My setup (Nov 2026)
| | |
|---|---|
| Machine | MacBook Air 15", M3 (8-core), 8 GB RAM, 512 GB |
| OS | macOS 26.5.1 |
| Terminal | Ghostty 1.4 + tmux 3.8 |
| Shell | zsh 5.9, plugins via antidote |
| Editor | Neovim 0.12 |
| Theme | Everforest Dark |
