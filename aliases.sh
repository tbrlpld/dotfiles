alias ls='ls -GF' # F - extended markup (/ after directory, * after executable), G - colorized output.
alias ll='ls -lh' # h - human readable file sizes
# alias ll='ls -lh --time-style=long-iso --group-directories-first'
alias la='ll -a'

# Python virtual environments
alias cve="python -m venv .venv"
alias ave="source .venv/bin/activate"

# Git
alias gdmb='git branch -d $(git branch --format "%(refname:lstrip=2)" --merged)'
