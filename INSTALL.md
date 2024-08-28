# Installation
## Prerequisites

Make sure [Perl](https://www.perl.org/) is installed:

```sh
perl -v
```

### Packages to install on a new system

#### General packages

```sh
sudo dnf install p7zip p7zip-plugins unrar xclip mc git neovim fdupes meld fd-find ripgrep doublecmd-gtk weechat fzf wget curl emacs vim zsh fish firejail abiword gnumeric thunderbird gpg rsync gimp ffmpeg-free youtube-dl brasero sound-juicer perl-Env perl-File-Copy zeal ranger htop fortune-mod perl-Image-ExifTool editorconfig sbcl glslang discount ShellCheck inkscape clamav clamav-update pandoc uuid texlive-scheme-medium autoconf automake gcc libpng-devel make poppler-devel poppler-glib-devel zlib-devel pkgconf macchanger rhythmbox libreoffice mpv util-linux-user terminator audacity fira-code-fonts zstd net-tools nethogs tcpdump iftop xfburn zoxide keepassxc flatpak zsh
```

#### Development tools

```sh
sudo dnf install gcc g++ cmake valgrind clang tmux ddd kcachegrind patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel boost-devel gtk3-devel clang-tools-extra
```

### Change default shell

```sh
chsh -s $(which zsh)
```

## Install oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

(See: https://ohmyz.sh/#install)

## Install asdf

See https://asdf-vm.com/guide/getting-started.html

```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
```

### Install Doom Emacs

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

## Setup script

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

See https://www.hackingthehike.com/fedora-40-after-install-guide/

## Fonts

### Doom Emacs

Sometimes the modeline icons and general icons cannot be loaded correctly causing nasty placeholder icons in the UI.

There are some font packages needed which can be installed from within emacs:

```
  M-x all-the-icons-install-fonts
```

and

```
  M-x nerd-icons-install-fonts
```

Following fonts should be installed on the system as well:

``` sh
  apt install fonts-firacode fonts-dejavu fonts-hack
```

**Important** Update the font cache afterwards:

``` sh
  fc-cache -f -v
```

### Fira Code

https://github.com/tonsky/FiraCode

### Hack

https://github.com/source-foundry/Hack#quick-installation

## How to enable rpmfusion repositories
See https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/

``` sh
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
