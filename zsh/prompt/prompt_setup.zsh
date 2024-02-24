prompt_vcs_style(){
  zstyle ':vcs_info:*' enable git
  # Check for staged and unstaged
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' max-exports 2
  local git_base="%{$fg[green]%}±%{$fg_bold[magenta]%}%b %u%c%"
  zstyle ':vcs_info:git*' stagedstr "%{$fg_bold[green]%}●"
  zstyle ':vcs_info:git*' unstagedstr "%{$fg_bold[red]%}●"
  zstyle ':vcs_info:git*' formats "[${git_base}%{$reset_color%}]"
  zstyle ':vcs_info:git*' actionformats "[${git_base} %{$fg[magenta]%}⌘ %a%{$reset_color%}]"
}

setopt PROMPT_SUBST
prompt_setup() {
  prompt_vcs_style
  PROMPT="[%F{14}%n@%M%f %F{14}%3~%f] %(?.%F{green}.%F{red})→%f "
  RPROMPT='%B${vcs_info_msg_0_}%b'
}
