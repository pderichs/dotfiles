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

#{{{aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias nuke="kill -9"

alias reload="source ~/.zshrc"
alias v="vim"
alias em="/usr/bin/env emacs -nw"

alias gsrem="git config --get remote.origin.url"
alias starttmux="~/starttmux"

alias updatetags="ctags -R --languages=ruby --exclude=.git --exclude=log -f .tags . $(bundle list --paths)"

alias s1off="xrandr --output eDP-1 --off"
#}}}

#{{{prompt
function dev_folder_indicator() {
  local color
  local symbol
  local ceoree

  if [[ $PWD =~ '^.*\/work(\/dev-gdk-ce|\/dev-gdk-ee)' ]]; then
  color="$fg[red]"
  symbol="*DEV*"
  else
  color="$fg[green]"
  symbol="-"
  fi

  if [[ $PWD =~ '^.*\/work\/(gdk-ce|dev-gdk-ce)' ]]; then
  ceoree=" CE"
  elif [[ $PWD =~ '^.*\/work\/(gdk-ee|dev-gdk-ee)' ]]; then
  ceoree=" EE"
  else
  ceoree=""
  fi

  echo -n "%{$color%}$symbol$ceoree"
}

set_prompt () {
  # echo $PROMPT
  PROMPT="%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M}] $(dev_folder_indicator) ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)
> "
}
precmd_functions+=set_prompt
set_prompt

#}}}

# Create TODO file
$HOME/todo_file.rb > /dev/null
