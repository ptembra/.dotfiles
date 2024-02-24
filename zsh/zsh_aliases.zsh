#--> ALIAS FILE <--#

#CONFIGS
alias zshconfig='nvim ~/.zshrc'
alias vimconfig='cd ~/.config/nvim && nvim ~/.config/nvim/'

#UTIL
c-wav-mp3 () {
  ffmpeg -i $1 $1:r.mp3
}

#QOL
#Default cmds
alias l="lsd -la --color always"
alias ..="cd .."

#git
alias ga="git add $1"
