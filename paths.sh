export PATH="$HOME/bin/:${PATH}"
export PATH="$PATH:$HOME/.local/bin" # Created by `userpath` on 2019-11-23 05:15:32

# Homebrew
export PATH="/usr/local/sbin:$PATH"
# Check platform
if [[ $(uname -m) == 'arm64' ]]; then
    # Check if homebrew directory exists / homebrew is installed.
    HOMEBREW_PREFIX_APPLE_SILICON="/opt/homebrew"
    if [ -d $HOMEBREW_PREFIX_APPLE_SILICON ]; then

        export PATH="$HOMEBREW_PREFIX_APPLE_SILICON/bin:$PATH"
    else
        echo "NO HOMEBREW"
    fi
fi
# m4
# m4 is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.
export PATH="/usr/local/opt/m4/bin:$PATH"

# ?
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Heroku
export PATH="/usr/local/opt/heroku-node/bin:$PATH"

# Docker
export PATH="$PATH:$HOME/.docker/bin"

