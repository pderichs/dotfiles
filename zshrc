# .zshrc

setopt extendedglob

# Set fzf installation directory path
export FZF_BASE=$(which fzf)

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f "$HOME/zshrc.local" ]; then
    source "$HOME/zshrc.local"
fi

# enables Alt+C etc
if [ -e /usr/share/doc/fzf/examples/key-bindings.bash ]; then
  source /usr/share/doc/fzf/examples/key-bindings.bash
fi

# enables "**" etc
if [ -e /usr/share/doc/fzf/examples/completion.bash ]; then
  source /usr/share/doc/fzf/examples/completion.bash
fi

# zoxide
eval "$(zoxide init zsh)"

# aliases
source "$HOME/shell.aliases"

# exports
export TODO="$HOME/todo"
export EDITOR='nvim'
export TERMINAL="terminator"
export TERM=xterm-256color
