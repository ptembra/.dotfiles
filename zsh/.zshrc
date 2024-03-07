#--> SETUP <--#

# Profiler
# zmodload zsh/zprof
# Load Plugins
source $HOME/.dotfiles/zsh/plugins.zsh

# Custom Prompt
fpath=($HOME/.dotfiles/zsh/prompt/prompt_setup.zsh $fpath)
source $HOME/.dotfiles/zsh/prompt/prompt_setup.zsh
autoload -Uz prompt_setup && prompt_setup

# Autocompletion
autoload -U compinit; compinit
source ~/.dotfiles/zsh/completion.zsh

#--> OH MY ZSH SETUP <--#

# export ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="robbyrussell"
# source $ZSH/oh-my-zsh.sh

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

# AUTOJUMP
# [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# TODO: Defer NVM
export NVM_DIR="$HOME/.nvm"
zsh-defer -c '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"'  # This loads nvm


export GOBIN=~/go/bin
export PATH=$PATH:$GOBIN
# if [ "$TMUX" = "" ]; then tmux; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

eval $(thefuck --alias)
eval "$(rbenv init - zsh)"

# styles VCS in prompt
prompt_vcs_style

# zprof
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rbenv/versions/3.3.0/bin/ruby:$PATH"
