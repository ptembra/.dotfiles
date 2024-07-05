#--> SETUP <--#
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

if [ -z "$TMUX" ]; then
    tmux attach -t main || tmux new -s main
fi

source $HOME/.dotfiles/zsh/zsh_init.zsh

# Profiler
# zmodload zsh/zprof

# Autocompletion
source $HOME/.dotfiles/zsh/completion.zsh

# Load Plugins
source $HOME/.dotfiles/zsh/plugins.zsh

# ALIASES
source $HOME/.dotfiles/zsh/zsh_aliases.zsh

# OPTIONS
setopt HIST_SAVE_NO_DUPS

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Defers NVM loading
export NVM_DIR="$HOME/.nvm"
zsh-defer -c '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"'  # This loads nvm

export GOBIN=~/go/bin
export PATH=$PATH:$GOBIN

eval $(thefuck --alias)
eval "$(rbenv init - zsh)"
eval "$(fzf --zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rbenv/versions/3.3.0/bin/ruby:$PATH"

# --> Leave as last
# Custom Prompt
fpath=($HOME/.dotfiles/zsh/prompt/prompt_setup.zsh $fpath)
source $HOME/.dotfiles/zsh/prompt/prompt_setup.zsh
autoload -Uz prompt_setup && prompt_setup

# styles VCS in prompt
prompt_vcs_style


# Python VENV path
# check for VENV in home folder
if [ -d "$HOME/.venv" ]; then
    export PATH="$HOME/.venv/bin:$PATH"
fi

# pnpm
export PNPM_HOME="/Users/pedro/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Created by `pipx` on 2024-04-06 00:22:01
export PATH="$PATH:/Users/pedro/.local/bin"
