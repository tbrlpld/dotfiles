# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
# Disable creation of .pyc (byte code files)
export PYTHONDONTWRITEBYTECODE=1

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Argcomplete autocompletion
source ~/.bash_completion.d/python-argcomplete.sh

# For pipx (to install isolated Python applications)
export PATH="$PATH:/Users/tibor/Library/Python/3.6/bin"
eval "$(register-python-argcomplete /Users/tibor/Library/Python/3.6/bin/pipx)"


# Pip requires to have an active virtual environment to install packages
export PIP_REQUIRE_VIRTUALENV=true
