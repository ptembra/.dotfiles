zmodload zsh/complist

source $(fzf --zsh) &> /dev/null

# Brew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

if [[ ! -o interactive ]]; then
    return
fi

compctl -K _pyenv pyenv

_pyenv() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(pyenv commands)"
  else
    completions="$(pyenv completions ${words[2,-2]})"
  fi

  reply=(${(ps:\n:)completions})
}

# source $(fabric completions zsh)

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# ZSH FZF
source ~/.antigen/bundles/Aloxaf/fzf-tab/fzf-tab.plugin.zsh

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
zstyle ':completion:*:*:*:*:descriptions' format '[%d]'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# preview directory's content with lsd when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color=always $realpath'

zstyle ':fzf-tab:complete:cp:*' fzf-preview 'lsd -1 --color=always $realpath'

zstyle ':fzf-tab:complete:mv:*' fzf-preview 'lsd -1 --color=always $realpath'

zstyle ':fzf-tab:complete:z:*' fzf-preview 'lsd -1 --color=always $realpath'

# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# tmux popup
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*:*:*:default' menu select

autoload -Uz compinit; compinit
compinit -u 

eval "$(ov --completion zsh)"
