# Path to neovim installation.
export PATH=/opt/nvim-osx64/bin:$PATH

###################
## => Oh My ZSH
###################

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme to load.
ZSH_THEME="robbyrussell"

# Plugins to load.
plugins=(git node npm tmux)

# Activate Oh My ZSH
source $ZSH/oh-my-zsh.sh

# Activate ZSH Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


###################
## => NVM
###################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###################
## => Variables
###################

export GO111MODULE="on"
