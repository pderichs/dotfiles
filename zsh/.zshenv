export TODO="$HOME/todo"

# Set fzf installation directory path
export FZF_BASE=$(which fzf)
# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"
# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR='vim'

if [ -d "$HOME/go" ]; then
    export PATH="$GOPATH/bin:$PATH"
fi

export PATH=$PATH:/usr/local/go/bin

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

export WXWIDGETS_VERSION="3.1.3"
if [ -d "$HOME/source/libs/wxWidgets-$WXWIDGETS_VERSION" ]; then
    export PATH="$HOME/source/libs/wxWidgets-$WXWIDGETS_VERSION:$PATH"
fi

export BOOST_DIR="$HOME/source/libs/boost_1_75_0"
