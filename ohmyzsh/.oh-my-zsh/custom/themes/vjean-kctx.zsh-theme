KUBE_PS1_PREFIX='k('
KUBE_PS1_SYMBOL_ENABLE=false

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%~%{$reset_color%} $(kube_ps1) $(git_prompt_info)'
PROMPT+=$'\n'
PROMPT+='%{$fg[cyan]%}%(!.#.$)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="g(%{$fg[blue]%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
