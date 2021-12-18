# Homebrew

export PATH="/usr/local/sbin:$PATH"

# Install Caveats

# # For compilers to find libffi you may need to set:
# export LDFLAGS="-L/usr/local/opt/libffi/lib"
# export CPPFLAGS="-I/usr/local/opt/libffi/include"
# # For pkg-config to find libffi you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"


# # For compilers to find openssl@1.1 you may need to set:
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# export LDFLAGS="-L/usr/local/opt/openssl/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl/include"
# # For pkg-config to find openssl@1.1 you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# # For compilers to find readline you may need to set:
# export LDFLAGS="-L/usr/local/opt/readline/lib"
# export CPPFLAGS="-I/usr/local/opt/readline/include"
# # For pkg-config to find readline you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# # For compilers to find sqlite you may need to set:
# export LDFLAGS="-L/usr/local/opt/sqlite/lib"
# export CPPFLAGS="-I/usr/local/opt/sqlite/include"
# # For pkg-config to find sqlite you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# m4
# m4 is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.
export PATH="/usr/local/opt/m4/bin:$PATH"

# # icu4c is keg-only, which means it was not symlinked into /usr/local,
# # because macOS provides libicucore.dylib (but nothing else).
# export PATH="/usr/local/opt/icu4c/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/sbin:$PATH"
# # For compilers to find icu4c you may need to set:
# export LDFLAGS="-L/usr/local/opt/icu4c/lib"
# export CPPFLAGS="-I/usr/local/opt/icu4c/include"
# # For pkg-config to find icu4c you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

# # krb5 is keg-only, which means it was not symlinked into /usr/local,
# # because macOS already provides this software and installing another version in
# # parallel can cause all kinds of trouble.
# export PATH="/usr/local/opt/krb5/bin:$PATH"
# export PATH="/usr/local/opt/krb5/sbin:$PATH"
# # For compilers to find krb5 you may need to set:
# export LDFLAGS="-L/usr/local/opt/krb5/lib"
# export CPPFLAGS="-I/usr/local/opt/krb5/include"
# # For pkg-config to find krb5 you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/krb5/lib/pkgconfig"

# # libxml2 is keg-only, which means it was not symlinked into /usr/local,
# # because macOS already provides this software and installing another version in
# # parallel can cause all kinds of trouble.
# # If you need to have libxml2 first in your PATH, run:
# export PATH="/usr/local/opt/libxml2/bin:$PATH"
# # For compilers to find libxml2 you may need to set:
# export LDFLAGS="-L/usr/local/opt/libxml2/lib"
# export CPPFLAGS="-I/usr/local/opt/libxml2/include"

# Guile libraries can now be installed here:
#     Source files: /usr/local/share/guile/site/3.0
#   Compiled files: /usr/local/lib/guile/3.0/site-ccache
#       Extensions: /usr/local/lib/guile/3.0/extensions

# Add the following to your .bashrc or equivalent:
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# If you are going to use the Guile bindings you will need to add the following
# to your .bashrc or equivalent in order for Guile to find the TLS certificates
# database:
export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/
