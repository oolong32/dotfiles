function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}
 
function isitgit {
    git branch >/dev/null 2>/dev/null && echo '♪' && return
    echo '•'
}

# add git info, feeding the variable $(git_prompt_info)
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%} %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}≈"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[yellow]%}♥"

# left prompt
PROMPT='%{$fg[yellow]%}(╯%{$reset_color%}%{$fg[red]%}°%{$reset_color%}%{$fg[yellow]%}□%{$reset_color%}%{$fg[red]%}°%{$reset_color%}%{$fg[yellow]%}%)╯ ${PWD/#$HOME/~}%{$reset_color%} %{$fg[red]%}$%{$reset_color%} '

# right prompt
RPROMPT='$(isitgit) $(git_prompt_info)'

