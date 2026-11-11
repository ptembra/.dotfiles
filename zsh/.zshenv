# Export Path
# #--> HOMEBREW
# Add Homebrew's executable directory to the front of the PATH

export ERL_AFLAGS="-kernel shell_history enabled"

export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"

# Deno CLI paths
export PATH=$HOME/.deno/bin:$PATH

export PATH=/usr/local/bin:$PATH
export PATH=~/bin:$PATH

# IntelliJ IDEA

export XDG_CONFIG_HOME="$HOME/.dotfiles"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SPICETIFY_CONFIG="$XDG_CONFIG_HOME"
