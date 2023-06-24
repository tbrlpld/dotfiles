source ~/.dotfiles/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
setopt PROMPT_SUBST ; PS1=$'\n''%{%F{blue}%}%B%9c%{%F{green}%}$(__git_ps1 " (%s)")%{%F{none}%} '$'\n''%% %b'
