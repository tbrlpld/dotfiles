# Homebrew
#
# NVM
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"

# Add the following to your .bashrc or equivalent:
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# If you are going to use the Guile bindings you will need to add the following
# to your .bashrc or equivalent in order for Guile to find the TLS certificates
# database:
export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/
