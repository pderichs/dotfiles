# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

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

if [ -d "$HOME/.config/emacs" ]; then
    export PATH=$HOME/.config/emacs/bin:$PATH
fi

if [ -d "$HOME/.asdf" ]; then
    . $HOME/.asdf/asdf.sh
fi

# Set JAVA_HOME for asdf installed java
if [ -e "$HOME/.asdf/shims/java" ]; then
    . $HOME/.asdf/plugins/java/set-java-home.zsh
fi

# Create TODO file
if [ -e "$HOME/todofile.pl" ]; then
    $HOME/todofile.pl > /dev/null
fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# enables Alt+C etc
if [ -e /usr/share/doc/fzf/examples/key-bindings.bash ]; then
  source /usr/share/doc/fzf/examples/key-bindings.bash
fi

# enables "**" etc
if [ -e /usr/share/doc/fzf/examples/completion.bash ]; then
  source /usr/share/doc/fzf/examples/completion.bash
fi

# zoxide
eval "$(zoxide init bash)"

# aliases
source "$HOME/shell.aliases"

# exports
export TODO="$HOME/todo"
export EDITOR='nvim'
export TERMINAL="terminator"
export TERM=xterm-256color
