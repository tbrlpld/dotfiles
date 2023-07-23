# Tab-completion according to git docs: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
# And updated according to the brew docs: https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  # Make all files found be used without asking, use the option -u
  compinit -u
fi

# NVM
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"

# Heroku
if type "heroku" > /dev/null; then
    $(heroku autocomplete:script zsh >> /dev/null)
fi

