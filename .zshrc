source ~/.dotfiles/paths.sh
source ~/.dotfiles/variables.sh
source ~/.dotfiles/aliases.sh
source ~/.dotfiles/prompt.zsh
source ~/.dotfiles/completions.sh

# Load Apple Keychain for ssh key passwords
ssh-add --apple-load-keychain &> /dev/null

# Add Bitwarden SSH agent
# App store install
export SSH_AUTH_SOCK=/Users/tibor/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock
# Direct .dmg install
#export SSH_AUTH_SOCK=/Users/tibor/.bitwarden-ssh-agent.sock

# Enable the fzf shell integration. See https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
source <(fzf --zsh)
