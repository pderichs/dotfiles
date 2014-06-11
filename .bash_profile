[[ -r ~/.bashrc ]] && . ~/.bashrc

export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

export EDITOR='subl -w'

export BUNDLER_EDITOR=$EDITOR

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi
if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true

# Used for go environment
export GOPATH=$HOME/Patrick/source/go

# COLORS
export CLICOLOR=1
export LSCOLORS=dxfxcxbxegedabagacad

# Patrick
alias ..='cd ..'
alias ls='ls -la'
alias rep='touch ~/.pow/restart.txt'
export POSTGRES=true

# Git aliases
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'
alias gpom="git pull origin master"
alias gp='git push origin master'
alias gba='git branch -a'
alias gbr='git branch'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# Grep colors
#export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='1;35;40'

# lock computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# emacs
alias em='emacs'

# simple ip
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'
# more details
alias ip1="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
# external ip
alias ip2="curl -s http://www.showmyip.com/simple/ | awk '{print $1}'"

# grep with color
alias grep='grep --color=auto'

# refresh shell
alias reload='source ~/.bash_profile'

# Prompt config
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export PS1='\[\033[0;33m\][\t] \[\033[0m\]\h \w $(__git_ps1 "(%s)")$ '
