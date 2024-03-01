#--> ALIAS FILE <--#

#CONFIGS
alias zshconfig='cd ~/.dotfiles/zsh/ && nvim .'
alias vimconfig='cd ~/.dotfiles/nvim/ && nvim .'

#UTIL
c-wav-mp3 () {
  ffmpeg -i $1 $1:r.mp3
}

#QOL
#Default cmds
alias l="lsd -la --color always"
alias ll="lsd -a --color always"
alias ..="cd .."

#git
alias ga="git add $1"
