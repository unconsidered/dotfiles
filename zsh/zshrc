# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# This is a workaround for having a system node and NVM node
PATH="/usr/local/bin:$(getconf PATH)"

# Path to your oh-my-zsh installation.
#export ZSH=/Users/${USER}/.oh-my-zsh


# Disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# How often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Use nvim as the default editor
export EDITOR=nvim
set -o vi
export VISUAL=vim
