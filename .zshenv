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

#{{{home bin folder
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
#}}}
