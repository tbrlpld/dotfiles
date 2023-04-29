## https://thepugautomatic.com/2008/12/git-dirty-prompt/
##
#parse_git_dirty() {
#  if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]]; then
#      echo "*"
#  fi
#}
## https://stackoverflow.com/a/56178134
#parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1 $(parse_git_dirty) )/'
#}
# setopt PROMPT_SUBST
# PROMPT='%9c%{%F{green}%}$(parse_git_branch)%{%F{none}%} $ '
source ~/.dotfiles/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
setopt PROMPT_SUBST ; PS1='%9c% $(__git_ps1 " (%s)") $ '
