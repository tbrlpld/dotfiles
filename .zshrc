source ~/.dotfiles/aliases.sh
source ~/.dotfiles/brew.sh
source ~/.dotfiles/editor.sh
source ~/.dotfiles/python-settings.sh
source ~/.dotfiles/paths.sh

if type "heroku" > /dev/null; then
    $(heroku autocomplete:script zsh >> /dev/null)
fi
