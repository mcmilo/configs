# Path to neovim installation.
# export PATH=/opt/nvim-osx64/bin:$PATH

###################
## => Oh My ZSH
###################

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme to load.
ZSH_THEME="robbyrussell"

# Plugins to load.
plugins=(git node npm tmux poetry)

# Activate Oh My ZSH
source $ZSH/oh-my-zsh.sh

# Activate ZSH Autosuggestions
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR="/usr/bin/nvim"

###################
## => TMUXIFIER
###################

export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

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
export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
export ANDROID_HOME=$HOME/Android/Sdk 
export PATH=$PATH:$ANDROID_HOME/tools 
export PATH=$PATH:$ANDROID_HOME/platform-tools

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/camilo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/camilo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/camilo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/camilo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
