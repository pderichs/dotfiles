# .zshrc

setopt extendedglob

# Needed for (vim-)gpg
export GPG_TTY=`tty`

# Uncomment this for laptop environments
# export PD_LAPTOP="1"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="candy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fzf
)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

chbr() {
  gco $(git branch -a | fzf)
}

# zoxide
eval "$(zoxide init zsh)"

# fzf related setup
source "$HOME/.shell/fzf"

# aliases
source "$HOME/.shell/aliases"

# exports
source "$HOME/.shell/exports"

# asdf
source "$HOME/.shell/asdf"

# Local customizations
if [ -f "$HOME/.shell/local" ]; then
    source "$HOME/.shell/local"
fi

# Create TODO file
if [ -e "$HOME/todofile.pl" ]; then
    $HOME/todofile.pl > /dev/null
fi
