# Git Shell Integration
autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info

# Loads Colours
autoload colors
colors

## Loads Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

## Loads ZSH-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Loads ZSH-auto-suggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
