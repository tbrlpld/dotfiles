# Disable creation of .pyc (byte code files)
export PYTHONDONTWRITEBYTECODE=1

# Pip requires to have an active virtual environment to install packages
export PIP_REQUIRE_VIRTUALENV=true

# Pyenv
eval "$(pyenv init -)"
