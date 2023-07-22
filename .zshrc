source ~/.dotfiles/aliases.sh
source ~/.dotfiles/paths.sh
source ~/.dotfiles/brew.sh
source ~/.dotfiles/editor.sh
source ~/.dotfiles/python-settings.sh
source ~/.dotfiles/node-settings.sh
source ~/.dotfiles/prompt.zsh

# Tab-completion according to git docs: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
# And updated according to the brew docs: https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

if type "heroku" > /dev/null; then
    $(heroku autocomplete:script zsh >> /dev/null)
fi
