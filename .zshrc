source ~/.dotfiles/paths.sh
source ~/.dotfiles/variables.sh
source ~/.dotfiles/aliases.sh
source ~/.dotfiles/prompt.zsh
source ~/.dotfiles/completions.sh

# Load Apple Keychain for ssh key passwords
ssh-add --apple-load-keychain &> /dev/null

# Enable the fzf shell integration. See https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
eval "$(fzf --zsh)"
