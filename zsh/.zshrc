# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

setopt prompt_subst
setopt extendedglob

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby fzf)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias nuke="kill -9"

alias reload="source ~/.zshrc"
alias v="vim"
alias em="emacs -nw"

alias gsrem="git config --get remote.origin.url"
alias starttmux="~/starttmux"

alias s1off="xrandr --output eDP-1 --off"

alias wifion="nmcli radio wifi on"
alias wifioff="nmcli radio wifi off"

# Records from microphone to output.wav
alias rec1="sox -t alsa default output.wav"

alias xo="xdg-open"

if [ -f "$HOME/localaliases" ]; then
    source "$HOME/localaliases"
fi

chbr() {
  gco $(git branch -a | fzf)
}

set_prompt () {
  # echo $PROMPT
  PROMPT="%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M}] ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)
> "
}

precmd_functions+=set_prompt
set_prompt

if [ -d "$HOME/.asdf" ]; then
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
fi

# Create TODO file
$HOME/todo_file.rb > /dev/null

# Add pip bin PATH
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

# Add npm binary path
export NODEBIN=$(npm config get prefix)/bin
if [ -d $NODEBIN ]; then
    export PATH=$PATH:$NODEBIN
fi
setxkbmap -option ctrl:nocaps
