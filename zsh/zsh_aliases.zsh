#--> ALIAS FILE <--#

#CONFIGS
alias zshconf='cd ~/.dotfiles/zsh/ && nvim'
alias vimconf='cd ~/.dotfiles/nvim/ && nvim'
alias tmuxconf='cd ~/.dotfiles/tmux/ && nvim'

#UTIL
c-wav-mp3 () {
  ffmpeg -i $1 $1:r.mp3
}

compress-mp3 () {
  local file=$1
  local file_output="c_${file:r}.mp3"
  # compress file while maintaing tags
  ffmpeg -i $file -map_metadata 0 -id3v2_version 3 $file_output
  echo "File $file_output created"
  # print both file-sizes
  echo -e "(OLD)File: $file size: \033[0;31m $(du -h $file | cut -f1) \033[0m"
  echo -e "(NEW)File: $file_output size: \033[0;31m $(du -h $file_output | cut -f1) \033[0m"
}

#QOL
#Default cmds
alias l="lsd -la --color always"
alias ll="lsd -a --color always"
alias ..="cd .."

#git
alias ga="git add $1"

alias cat="bat"

alias cd="z"

# alias tmux="tmux -f '$XDG_CONFIG_HOME/tmux/tmux.conf'"
