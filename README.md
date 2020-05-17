# dotfiles

My dotfiles.

# Prerequisites

* emacs
* vim

# Installation

## Steps

```
  git clone ... $HOME/dotfiles

  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

  ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
  ln -s $HOME/dotfiles/.zshenv $HOME/.zshenv
  ln -s $HOME/dotfiles/.spacemacs $HOME/.spacemacs
  ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
  ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
  ln -s $HOME/dotfiles/starttmux $HOME/starttmux
  ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
  ln -s $HOME/dotfiles/.gitexcludes $HOME/.gitexcludes
  ln -s $HOME/dotfiles/.gitignore $HOME/.gitignore
  ln -s $HOME/dotfiles/.irbrc $HOME/.irbrc
  ln -s $HOME/dotfiles/.rspec $HOME/.rspec
  ln -s $HOME/dotfiles/custom-functions.el $HOME/custom-functions.el
  ln -s $HOME/dotfiles/todo_file.rb $HOME/todo_file.rb
```

## Install zsh

```
  sudo apt-get install zsh
```

## Make zsh the default shell

```
  chsh -s $(which zsh)
```

## Install oh-my-zsh

[ohmyzsh](https://github.com/robbyrussell/oh-my-zsh).

```
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Install fzf

[fzf](https://github.com/junegunn/fzf)

Update the path to fzf in `.zshrc` - see `FZF_BASE`.

## Install badwolf color scheme

```
  mkdir ~/.vim/colors
```

## Install [asdf](https://github.com/asdf-vm/asdf)

[https://asdf-vm.com/#/core-manage-asdf-vm](https://asdf-vm.com/#/core-manage-asdf-vm)

```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
```

[Color scheme raw content](https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim)

## Install Vundle

[Vundle](https://github.com/VundleVim/Vundle.vim).

```
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
[Vundle for Windows](https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows)

## Install vim plugins

In vim:

```
  :BundleInstall
```

## Install Powerline Fonts

https://github.com/powerline/fonts

## TODO file script

I have a TODO file for every day. A simple ruby script takes care of copying the old todo file contents to the todo file of today. The script must be located in the home folder:

```
  ln -s path/to/dotfiles/clone/todo_file.rb ~/todo_file.rb
```
## TAGS file creation

### (spac)emacs

In (ruby) project folder:

```
ctags -e -R --languages=ruby --exclude=.git --exclude=log -f .tags . $(bundle list --paths)
```

This file can be used with e.g.

```
helm-etags-select
```

### vim

```
ctags -R --languages=ruby --exclude=.git --exclude=log -f .tags . $(bundle list --paths)
```
## Install dmenu

A pretty good fuzzy app finder for e.g. xfce which can be bind to winkey.

`dmenu_run`

## Install i3

https://fedoramagazine.org/getting-started-i3-window-manager/

`ln -s /path/to/dotfiles/i3/config ~/.config/i3/config`

