export TODO=$HOME/todo

# Set fzf installation directory path
export FZF_BASE=/usr/bin/fzf
# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"
# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR='vim'

#{{{go
if [ -d "$HOME/go" ]; then
    # export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$PATH"
fi

export PATH=$PATH:/usr/local/go/bin
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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
