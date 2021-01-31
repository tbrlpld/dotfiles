# Disable creation of .pyc (byte code files)
export PYTHONDONTWRITEBYTECODE=1

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Argcomplete autocompletion
source ~/.bash_completion.d/python-argcomplete.sh


# Pip requires to have an active virtual environment to install packages
export PIP_REQUIRE_VIRTUALENV=true
