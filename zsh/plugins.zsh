# Git Shell Integration
autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info

# Loads Colours
autoload colors
colors

# Loads Zoxide
eval "$(zoxide init zsh)"

source ~/.dotfiles/zsh/plugins/zsh-defer/zsh-defer.plugin.zsh

export ANTIGEN_LOG="$HOME/.dotfiles/zsh/antigen.log"
source $(brew --prefix)/share/antigen/antigen.zsh

antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
