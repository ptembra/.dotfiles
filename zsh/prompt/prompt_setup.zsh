# one git call per prompt: psvar[1] = staged count, psvar[2] = unstaged count (empty when 0 or not a repo)
git_check_files(){
  psvar[1]= psvar[2]=
  local out x s=0 m=0
  out=$(git status --porcelain 2>/dev/null) || return
  for x in ${(f)out}; do
    [[ $x[1] != [\ ?] ]] && (( s++ ))
    [[ $x[2] != [\ ?] ]] && (( m++ ))
  done
  (( s )) && psvar[1]=$s
  (( m )) && psvar[2]=$m
}

# Git info runs in a background subshell so the prompt draws instantly; RPROMPT fills in when it finishes.
_git_async_fd= _git_async_dir=
_git_async_start(){
  if [[ -n $_git_async_fd ]]; then
    zle -F $_git_async_fd 2>/dev/null; exec {_git_async_fd}<&-; _git_async_fd=
  fi
  # new directory: drop the previous repo's info rather than show it while the check runs
  if [[ $PWD != $_git_async_dir ]]; then
    vcs_info_msg_0_= psvar[1]= psvar[2]= _git_async_dir=$PWD
  fi
  exec {_git_async_fd}< <(vcs_info; git_check_files; print -rn -- "$vcs_info_msg_0_"$'\0'"$psvar[1]"$'\0'"$psvar[2]")
  zle -F -w $_git_async_fd _git_async_done
}
_git_async_done(){
  local fd=$1 msg s m
  zle -F $fd
  IFS= read -r -d $'\0' -u $fd msg; IFS= read -r -d $'\0' -u $fd s; IFS= read -r -u $fd m
  exec {fd}<&-; _git_async_fd=
  vcs_info_msg_0_=$msg psvar[1]=$s psvar[2]=$m
  zle reset-prompt
}
add-zsh-hook precmd _git_async_start

prompt_vcs_style(){
  zstyle ':vcs_info:*' enable git
  # Check for staged and unstaged
  # change counts come from git_check_files (cheaper than vcs_info's own check)
  zstyle ':vcs_info:*' check-for-changes false
  zstyle ':vcs_info:*' max-exports 2
  local git_base="%{$fg[green]%}±%{$fg_bold[yellow]%}%b%%(1V.%{$fg_bold[green]%} ✓:%1v.)%%(2V.%{$fg_bold[red]%} 𝓍:%2v.)"
  zstyle ':vcs_info:git*' stagedstr "%{$fg_bold[green]%} ✓:%v"
  zstyle ':vcs_info:git*' unstagedstr "%{$fg_bold[red]%} 𝓍:%2v"
  zstyle ':vcs_info:git*' formats "[${git_base}%{$reset_color%}]"
  zstyle ':vcs_info:git*' actionformats "[${git_base} %{$fg[magenta]%}⌘ %a%{$reset_color%}]"
}

tmux_indicator(){
  if ! [[ $TMUX ]]; then
    echo "%F{red}%f "
  fi
}

_prompt_str="$(tmux_indicator) %F{14}%F{12}%8~%f %(?.%F{green}.%F{red})→%f "

collapse_prompt_on_enter(){
  PROMPT="%F{14}%f %F{12}%3~%f %(?.%F{green}.%F{red})→%f "
  RPROMPT=""
  zle reset-prompt
  PROMPT="$_prompt_str"
  RPROMPT='$vcs_info_msg_0_'  # single quotes: re-read each prompt, not frozen now
  zle accept-line
}

set -o PROMPT_SUBST
prompt_setup() {
  zle -N collapse_prompt_on_enter
  zle -N _git_async_done
  bindkey "^M" collapse_prompt_on_enter

  PROMPT='$_prompt_str'
  RPROMPT='$vcs_info_msg_0_'
}
