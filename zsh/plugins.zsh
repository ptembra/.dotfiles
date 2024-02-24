# Git Shell Integration
autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info

autoload colors
colors

## Loads ZSH-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Loads ZSH-auto-suggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
