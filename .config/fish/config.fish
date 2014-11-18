set -xg EDITOR 'subl -w'

set -xg BUNDLER_EDITOR $EDITOR

# rbenv
set -xg PATH $HOME/.rbenv/bin $PATH
set -xg PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Go path
set -xg GOPATH $HOME/go

# Aliases

# Pow
alias rep='touch ~/.pow/restart.txt'

# Git
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

# emacs
alias em='emacs'

# lock computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# simple ip
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'
# more details
alias ip1="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
# external ip
alias ip2="curl -s http://www.showmyip.com/simple/ | awk '{print $1}'"

# grep with color
alias grep='grep --color=auto'
