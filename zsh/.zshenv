# Export Path
# #--> HOMEBREW
# Add Homebrew's executable directory to the front of the PATH

export PATH=Users/pedro/.rbenv/shims:$PATH

export ERL_AFLAGS="-kernel shell_history enabled"

export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"

# Deno CLI paths
export PATH=$HOME/.deno/bin:$PATH

export PATH=/usr/local/bin:$PATH
export PATH=~/bin:$PATH

# IntelliJ IDEA

export HISTFILE="~/.dotfiles/zsh/history/.zhistory"
export HISTSIZE=5000
export SAVEHIST=5000

export XDG_CONFIG_HOME="$HOME/.dotfiles"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SPICETIFY_CONFIG="$XDG_CONFIG_HOME"
