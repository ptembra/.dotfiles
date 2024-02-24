

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '%F{magenta}(%b%F{red}%u%f%F{green}%c%F{magenta})%f'
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'

setopt PROMPT_SUBST
prompt_setup() {
  PROMPT="[%F{14}%n@%M%f %F{14}%3~%f] %(?.%F{green}.%F{red})→%f "
  RPROMPT='%B${vcs_info_msg_0_}%b'
}
