# Git Shell Integration
autoload -Uz add-zsh-hook vcs_info
# vcs_info runs async from prompt/prompt_setup.zsh

# Loads Colours
autoload colors
colors

# Loads Zoxide
eval "$(zoxide init zsh)"

export ATUIN_NOBIND=1

# Plugins: list in .zsh_plugins.txt; antidote rebuilds the static .zsh_plugins.zsh only when the list changes
zsh_plugins=$ZDOTDIR/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi
source ${zsh_plugins}.zsh

