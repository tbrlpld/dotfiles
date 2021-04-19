# Homebrew Install Caveats

# For compilers to find libffi you may need to set:
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/libffi/include"
# For pkg-config to find libffi you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"


# For compilers to find openssl@1.1 you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# For pkg-config to find openssl@1.1 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# For compilers to find readline you may need to set:
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
# For pkg-config to find readline you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# For compilers to find sqlite you may need to set:
export LDFLAGS="-L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include"
# For pkg-config to find sqlite you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"

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
