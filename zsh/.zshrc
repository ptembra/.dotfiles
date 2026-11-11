#--> SETUP <--#
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# only auto-attach from Ghostty, so other apps' terminals don't spawn the tmux server
if [ -z "$TMUX" ] && [[ $TERM_PROGRAM == ghostty ]]; then
    tmux attach -t main || tmux new -s main
fi

source $XDG_CONFIG_HOME/zsh/zsh_init.zsh

# Profiler
# zmodload zsh/zprof

# Load Plugins
source $XDG_CONFIG_HOME/zsh/plugins.zsh

# ALIASES
source $XDG_CONFIG_HOME/zsh/zsh_aliases.zsh

# OPTIONS
setopt HIST_SAVE_NO_DUPS

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# NVM: default alias is "node" (newest installed), so put that on PATH directly;
# `nvm use` at load costs ~300ms, --no-use skips it
export NVM_DIR="$HOME/.nvm"
path=($NVM_DIR/versions/node/*/bin(Nn[-1]) $path)
zsh-defer -c '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh" --no-use'


export GOBIN=~/go/bin
export PATH=$PATH:$GOBIN

# thefuck costs ~150ms to init, so load it on first use
fuck() { unfunction fuck; eval "$(thefuck --alias)"; fuck "$@"; }
zsh-defer -c 'eval "$(rbenv init - --no-rehash zsh)"'
eval "$(fzf --zsh)"

# Autocompletion
# source <(fabric completions zsh)

source $XDG_CONFIG_HOME/zsh/completion.zsh
# Python VENV path
# check for VENV in home folder
if [ -d "$HOME/.venv" ]; then
    export PATH="$HOME/.venv/bin:$PATH"
fi

# Created by `pipx` on 2024-04-06 00:22:01
export PATH="$PATH:/Users/pedro/.local/bin"

# MATLAB Cli
alias matlab="/Applications/MATLAB_R2024b.app/bin/matlab -nojvm -nodesktop"

# Diable autin up arrow
eval "$(atuin init zsh --disable-up-arrow)"

# --> Leave as last
# Custom Prompt
fpath=($XDG_CONFIG_HOME/zsh/prompt/prompt_setup.zsh $fpath)
source $XDG_CONFIG_HOME/zsh/prompt/prompt_setup.zsh
autoload -Uz prompt_setup && prompt_setup

# styles VCS in prompt
prompt_vcs_style


# pnpm
export PNPM_HOME='/Users/pedro/Library/pnpm'
case ":$PATH:" in
  ":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
