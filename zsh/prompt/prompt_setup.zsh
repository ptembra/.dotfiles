git_check_modified_files(){
  if [ $(git rev-parse --is-inside-work-tree 2&> /dev/null)='true' ]; then
    echo $(git ls-files -dmu 2> /dev/null | wc -l &> /dev/null | xargs)
  fi
}

git_check_staged_files(){
  if [ $(git rev-parse --is-inside-work-tree 2&> /dev/null)='true' ]; then
    echo $(git diff --cached --name-only | wc -l &> /dev/null | xargs)
  fi
}

prompt_vcs_style(){
  zstyle ':vcs_info:*' enable git
  # Check for staged and unstaged
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' max-exports 2
  local git_base="%{$fg[green]%}±%{$fg_bold[yellow]%}%b%u%c"
  zstyle ':vcs_info:git*' stagedstr "%{$fg_bold[green]%} ✓:$(git_check_staged_files)"
  zstyle ':vcs_info:git*' unstagedstr "%{$fg_bold[red]%} 𝓍:$(git_check_modified_files)"
  zstyle ':vcs_info:git*' formats "[${git_base}%{$reset_color%}]"
  zstyle ':vcs_info:git*' actionformats "[${git_base} %{$fg[magenta]%}⌘ %a%{$reset_color%}]"
}

setopt PROMPT_SUBST
prompt_setup() {
  prompt_vcs_style
  PROMPT="[%F{14}%n@%M%f | %F{12}%3~%f] %(?.%F{green}.%F{red})→%f "
  RPROMPT='$vcs_info_msg_0_'
}
