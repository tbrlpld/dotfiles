parse_git_branch() {
    # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    git symbolic-ref --short HEAD 2> /dev/null
}
git_prompt() {
 ref=$(git symbolic-ref --short HEAD 2> /dev/null)
 echo " ($ref)"
}

setopt PROMPT_SUBST
# PROMPT='%9c%{%F{green}%}$(parse_git_branch)%{%F{none}%} $ '
PROMPT='%9c%{%F{green}%}$(git_prompt)%{%F{none}%} $ '
