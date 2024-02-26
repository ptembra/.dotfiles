git_check_staged_files(){
  if [ $(git rev-parse --is-inside-work-tree 2&> /dev/null)='true' ]; then
    psvar[1]=$(command git diff --cached --name-only &> /dev/null | command wc -l | command xargs)
  fi
}

git_check_modified_files(){
  if [ $(git rev-parse --is-inside-work-tree 2&> /dev/null)='true' ]; then
    psvar[2]=$(git ls-files -dmu 2&> /dev/null | wc -l &> /dev/null | xargs)
  fi
}


add-zsh-hook precmd git_check_modified_files
add-zsh-hook precmd git_check_staged_files

prompt_vcs_style(){
  zstyle ':vcs_info:*' enable git
  # Check for staged and unstaged
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' max-exports 2
  local git_base="%{$fg[green]%}±%{$fg_bold[yellow]%}%b%u%c"
  zstyle ':vcs_info:git*' stagedstr "%{$fg_bold[green]%} ✓:%v"
  zstyle ':vcs_info:git*' unstagedstr "%{$fg_bold[red]%} 𝓍:%2v"
  zstyle ':vcs_info:git*' formats "[${git_base}%{$reset_color%}]"
  zstyle ':vcs_info:git*' actionformats "[${git_base} %{$fg[magenta]%}⌘ %a%{$reset_color%}]"
}

setopt PROMPT_SUBST
prompt_setup() {
  PROMPT="[%F{14}%n@%m%f | %F{12}%3~%f] %(?.%F{green}.%F{red})→%f "
  RPROMPT='$vcs_info_msg_0_'
}
