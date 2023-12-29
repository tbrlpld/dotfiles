source ~/.dotfiles/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

# Custom Python virtual env prompt.
#
# The default one adds it self directly before the normal prompt. But mine starts with a linebreak. This means that the venv prompt is on one line and the directory and git info on another.
function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv) "
}
# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1
VENV="\$(virtualenv_info)";

setopt PROMPT_SUBST ; PS1=$'\n'$VENV'''%{%F{blue}%}%B%9c%{%F{green}%}$(__git_ps1 " (%s)")%{%F{none}%} '$'\n''%% %b'

