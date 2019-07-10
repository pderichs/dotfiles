# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TODO=$HOME/Dokumente/todo

setopt prompt_subst
setopt extendedglob

#{{{fzf
# Set fzf installation directory path
export FZF_BASE=/usr/bin/fzf

# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"

#}}}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby fzf)

#{{{oh-my-zsh
source $ZSH/oh-my-zsh.sh
#}}}

#{{{general exports
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR='vim'

#{{{go
if [ -d "$HOME/go" ]; then
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
fi
#}}}

#{{{rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
#}}}

#{{{rvm
if [ -d "$HOME/.rvm" ]; then
  export PATH="$HOME/.rvm/bin:$PATH"
fi
#}}}

#{{{home bin folder
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi
#}}}

#}}}

#{{{aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias nuke="kill -9"

if [ "$(uname)" = "Darwin" ]; then
  alias ctags="/usr/local/Cellar/ctags/5.8_1/bin/ctags"
fi

alias reload="source ~/.zshrc"
alias v="vim"
alias em="/usr/bin/env emacs -nw"

alias ce-run="tmuxinator start gdk-ce"
alias ee-run="tmuxinator start gdk-ee"

alias gsrem="git config --get remote.origin.url"
alias starttmux="~/starttmux"
# alias bundle="bundle install -j4"
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

