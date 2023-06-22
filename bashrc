# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

unset rc

# Uncomment this for laptop environments
# export PD_LAPTOP="1"

# Create TODO file
if [ -e "$HOME/todofile.pl" ]; then
    $HOME/todofile.pl > /dev/null
fi

# fzf related setup
source "$HOME/.shell/fzf"

# zoxide
eval "$(zoxide init bash)"

# aliases
source "$HOME/.shell/aliases"

# exports
source "$HOME/.shell/exports"

# Local customizations
if [ -f "$HOME/.shell/local" ]; then
    source "$HOME/.shell/local"
fi
