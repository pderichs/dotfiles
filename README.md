# dotfiles

My dotfiles.

# Installation

## Steps

```bash
  git clone ... $HOME/dotfiles
```

You can then use [`stow`](http://www.gnu.org/software/stow/) to link the config files as needed:

```bash
  stow emacs
  stow zsh
  stow git
  # ...
```

## Install ZSH

```bash
  sudo dnf install zsh
```

## Make ZSH the default shell

```
  chsh -s $(which zsh)
```

## Install [ohmyzsh](https://github.com/robbyrussell/oh-my-zsh)

```
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Install [fzf](https://github.com/junegunn/fzf)

Update the path to fzf in `.zshrc` - see `FZF_BASE`.

## Install [asdf](https://github.com/asdf-vm/asdf)

[https://asdf-vm.com/#/core-manage-asdf-vm](https://asdf-vm.com/#/core-manage-asdf-vm)

```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
```

## Install [Vundle](https://github.com/VundleVim/Vundle.vim)

```
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
[Vundle for Windows](https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows)

## Install Vim Plugins

In vim:

```
  :BundleInstall
```

## Install Powerline Fonts

https://github.com/powerline/fonts

## TODO File Script

I have a TODO file for every day. A simple ruby script takes care of copying the old todo file contents to the todo file of today. The script must be located in the home folder:

```
  ln -s path/to/dotfiles/clone/todo_file.rb ~/todo_file.rb
```
## TAGS file creation

### Emacs

In (e.g. a ruby) project folder:

```
  ctags -e -R --languages=ruby --exclude=.git --exclude=log -f .tags . $(bundle list --paths)
```

This file can be used in emacs with e.g.

```
  helm-etags-select
```

## Install dmenu

A pretty good fuzzy app finder for e.g. xfce which can be bind to winkey.

`dmenu_run`

## Install i3

https://fedoramagazine.org/getting-started-i3-window-manager/

`ln -s /path/to/dotfiles/i3/config ~/.config/i3/config`

## Known issues

### Emacs key configuration interferes with Xfce4 default settings

Xfce has some default key bindings which interfere with the emacs config in this repo (namely `C+<f11>` and `C+<f12>`).

**Solution** Comment out the relevant configuration entries for the switch workspace keys in `~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml`:

```xml
      <!-- <property name="&lt;Primary&gt;F5" type="string" value="workspace_5_key"/> -->
      <!-- <property name="&lt;Primary&gt;F10" type="string" value="workspace_10_key"/> -->
      <!-- <property name="&lt;Primary&gt;F11" type="string" value="workspace_11_key"/> -->
      <!-- <property name="&lt;Primary&gt;F12" type="string" value="workspace_12_key"/> -->
```
