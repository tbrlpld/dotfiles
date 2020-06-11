# alias ls='ls -FG' # F - extended markup (/ after directory, * after executable), G - colorized output.
# alias ll='ls -lh' # h - human readable file sizes
alias ls='/usr/local/bin/gls -p --color'
alias ll='ls -lh --time-style=long-iso --group-directories-first'
alias la='ll -a'

# Python virtual environments
alias cve="python -m venv .venv"
alias ave="source .venv/bin/activate"