# Git Shell Integration
autoload -Uz add-zsh-hook vcs_info
# vcs_info runs async from prompt/prompt_setup.zsh

# Loads Colours
autoload colors
colors

# Loads Zoxide
eval "$(zoxide init zsh)"

source ~/.dotfiles/zsh/plugins/zsh-defer/zsh-defer.plugin.zsh

export ANTIGEN_LOG="$HOME/.dotfiles/zsh/antigen.log"
source /opt/homebrew/share/antigen/antigen.zsh

export ATUIN_NOBIND=1

antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle atuinsh/atuin@main
antigen apply

