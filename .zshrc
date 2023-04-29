source ~/.dotfiles/aliases.sh
source ~/.dotfiles/brew.sh
source ~/.dotfiles/editor.sh
source ~/.dotfiles/iterm-settings.sh
source ~/.dotfiles/python-settings.sh
source ~/.dotfiles/paths.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type "heroku" > /dev/null; then
    $(heroku autocomplete:script zsh >> /dev/null)
fi
