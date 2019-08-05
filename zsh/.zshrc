# This is a workaround for having a system node and NVM node
PATH="/usr/local/bin:/snap/bin:$(getconf PATH)"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/Library/TeX/texbin:$PATH

# vi mode
bindkey -v

# fix backspace in vi mode
bindkey "^?" backward-delete-char


# hist
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

export ERL_AFLAGS="-kernel shell_history enabled"


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
# Antibody plugin manager
source <(antibody init)
antibody bundle denysdovhan/spaceship-prompt

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
# SPACESHIP_VI_MODE_SHOW="true"
SPACESHIP_VI_MODE_COLOR="green"
spaceship_vi_mode_enable

# Use nvim as the default editor
export EDITOR=nvim
set -o vi
export VISUAL=vim
