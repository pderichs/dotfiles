# .zshrc

setopt extendedglob

# gpg
export GPG_TTY=$(tty)

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

# Disable caps lock on linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    setxkbmap -option caps:none 2>/dev/null
fi

# Can be used on systems which do not support storing of keys (xfce)
# eval $(keychain --eval --agents ssh id_ed25519)

# Local customizations
if [ -f "$HOME/rc.local" ]; then
    source "$HOME/rc.local"
fi

export PATH="$HOME/.local/bin:$PATH"
