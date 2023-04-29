source ~/.dotfiles/aliases.sh
source ~/.dotfiles/brew.sh
source ~/.dotfiles/editor.sh
source ~/.dotfiles/python-settings.sh
source ~/.dotfiles/paths.sh
source ~/.dotfiles/prompt.zsh

if type "heroku" > /dev/null; then
    $(heroku autocomplete:script zsh >> /dev/null)
fi
