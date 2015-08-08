# dotfiles

My dotfiles.

# Prerequisites

* vim
* emacs (>= 24.4.x)

# Installation

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

## Install Vundle

[Vundle](https://github.com/VundleVim/Vundle.vim).

```
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Install vim plugins

In vim:

```
  :BundleInstall
```

