# dotfiles

My dotfiles.

## Prerequisites

Make sure [Perl](https://www.perl.org/) is installed:

```sh
perl -v
```

### Packages to install on a new system

#### Prerequisites

Enable rpmfusion repositories.

``` sh
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

#### General packages

```sh
sudo dnf install p7zip p7zip-plugins unrar xclip mc git neovim fdupes meld fd-find ripgrep doublecmd-gtk weechat fzf wget curl emacs vim zsh fish firejail abiword gnumeric thunderbird gpg rsync gimp ffmpeg youtube-dl brasero sound-juicer perl-Env perl-File-Copy zeal ranger htop fortune-mod perl-Image-ExifTool editorconfig sbcl glslang discount ShellCheck inkscape clamav clamav-update pandoc uuid texlive-scheme-medium autoconf automake gcc libpng-devel make poppler-devel poppler-glib-devel zlib-devel pkgconf macchanger rhythmbox libreoffice mpv util-linux-user terminator audacity fira-code-fonts zstd net-tools nethogs tcpdump iftop xfburn
```

#### Development tools

```sh
sudo dnf install gcc g++ cmake valgrind clang tmux ddd kcachegrind patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel boost-devel
```

#### Install Doom Emacs

See https://github.com/doomemacs/doomemacs#install

``` sh
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```

### Install flatpak source on Fedora

```sh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

This makes apps like vlc and signal desktop available e.g.:

``` sh
flatpak install flathub org.videolan.VLC
```

Run flatpaks by using `run`:

``` sh
flatpak run org.videolan.VLC
```

Create a `bin` script for easy access if needed.

### Install oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

(See: https://ohmyz.sh/#install)

### Change default shell

```sh
chsh -s /bin/zsh
```

### Install asdf

See https://asdf-vm.com/guide/getting-started.html

```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
```

### Neovim 

Install [Packer](https://github.com/wbthomason/packer.nvim):

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Restart neovim and run

```sh
:PackerInstall
```

To install C++ tooling run `Mason` and install e.g. `clang` and `zls`.

For additional C++ support run

```sh
:TSInstallSync cpp
```

#### Additional information

If the data folder in neovim folder is available, make sure the folder in .local/share/nvim ($XDG_DATA_HOME) is not existing, since it will be replaced by a symlink to the existing data folder.

See `:h standard-path` for further information on paths used by neovim.

### vim: Install vim plug

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

(See: https://github.com/junegunn/vim-plug)

In vim

```sh
:PlugInstall
```

## Installation

### Link dotfiles to HOME folder

```sh
./setup install
```

### List links in HOME folder for debug purpose

```sh
./setup status
```

### Remove links in HOME folder

**Attention!** This is a **destructive** operation! Check the files in HOME and the code of the `setup` script before executing this!

```sh
./setup uninstall
```

# Additional links

## Additional information regarding system setup

See https://www.hackingthehike.com/fedora38-guide/

## VLC 

See https://www.videolan.org/vlc/download-fedora.html

``` sh
su -
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install vlc
dnf install python-vlc (optional)
```

## Fonts

### Fira Code

https://github.com/tonsky/FiraCode

### Hack

https://github.com/source-foundry/Hack#quick-installation

# License

[GPLv3](https://www.gnu.org/licenses/gpl-3.0.txt)

Copyright (C) 2023 pderichs <derichs@posteo.de>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
