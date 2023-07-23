# Standard Editor
export EDITOR='vim'
export VISUAL='vim'

# Not relly and editor, but I still put it here
export BAT_THEME='base16'

# Python
# Disable creation of .pyc (byte code files)
export PYTHONDONTWRITEBYTECODE=1
# Pip requires to have an active virtual environment to install packages
export PIP_REQUIRE_VIRTUALENV=true
# Use pyenv controlled python3 for pipx.
export PIPX_DEFAULT_PYTHON=$(pyenv which python3)

# NVM
export NVM_DIR="$HOME/.nvm"

# Add the following to your .bashrc or equivalent:
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# If you are going to use the Guile bindings you will need to add the following
# to your .bashrc or equivalent in order for Guile to find the TLS certificates
# database:
export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/
