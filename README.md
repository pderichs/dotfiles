# dotfiles

My dotfiles. 

A bash script is used to create the relevant symlinks in the HOME folder.

# Prerequisites

## Debian

System setup for Debian:

```bash
sudo apt install -y adduser ansible autoconf automake baobab bash bash-completion bind9-dnsutils bind9-host blueman bluez brave-browser breeze-cursor-theme bsdutils build-essential busybox bzip2 ca-certificates calibre catfish clamav clang clang-format clang-tidy cmake cppcheck cron curl delta diffutils direnv dkms dmidecode dmz-cursor-theme doc-debian docker-buildx-plugin docker-ce docker-ce-cli docker-compose-plugin dosfstools dpkg dpkg-dev e2fsprogs fastfetch fd-find fdisk fdupes file findutils fish fortune-mod fzf g++ gcc geogebra gettext-base gimp git git-delta gnome-shell-extension-appindicator gnome-shell-extension-prefs gopls gpg-agent grep htop hx ifupdown imagemagick img2pdf inkscape inxi keepassxc keyboard-configuration keychain keyd kitty lazarus less libcairo2-dev libgccjit-14-dev libgif-dev libgl1-mesa-dev libgmp-dev libgmp10  libgnutls28-dev libgpm-dev libgtk-3-dev libharfbuzz-dev libjansson-dev libjansson4 libjpeg-dev libjpeg62-turbo-dev libk5crypto3 liblocale-gettext-perl liblzma5 libm17n-dev libmagickwand-dev libncurses-dev libncursesw6 libotf-dev libpcre2-8-0 libpng-dev libqt5svg5-dev libqt5test5t64 libqt5websockets5-dev libqt6test6 libreadline-dev libreadline8t64 librsvg2-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libselinux1-dev libsemanage-common libsqlite3-dev libss2 libssl-dev libssl3t64 libsystemd-dev libsystemd-shared libsystemd0 libtext-charwidth-perl libtext-iconv-perl libtext-wrapi18n-perl libtiff-dev libtinfo6 libtirpc-common libtirpc3t64 libtree-sitter-dev libudev1 libunistring5 libuuid1 libvterm-dev libwebp-dev libwxgtk3.2-dev libx11-dev libxaw7-dev libxcb-cursor0 libxi-dev libxml2-dev libxrandr-dev libxtables12 libxxhash0 libyaml-dev libzstd1 linux-headers-amd64 linux-sysctl-defaults locales logrotate logsave lsb-release lsof mailutils make man-db manpages markdown mate-desktop-environment-extras mawk maxima mc media-types mesa-common-dev mise mount nano ncurses-base ncurses-bin ncurses-term netbase netcat-traditional nftables ninja-build nvidia-driver octave openssh-client openssh-server openssl openssl-provider-legacy os-prober pandoc passwd pciutils pdfarranger peek perl perl-base pkg-config procps  qpdf qt5-qmake qt6-base-dev qt6-base-dev-tools qt6-tools-dev qt6-tools-dev-tools qtbase5-dev qtbase5-dev-tools qtbase5-private-dev qtchooser qtdeclarative5-dev qtmultimedia5-dev quilt ranger readline-common reportbug ripgrep rmlint rsync sbcl sed sensible-utils sharutils shellcheck shim-signed simple-scan simplescreenrecorder sqlite3 sqv steam:i386 systemd systemd-cryptsetup systemd-sysv systemd-timesyncd sysvinit-utils tar task-cinnamon-desktop task-desktop task-german task-german-desktop task-ssh-server task-xfce-desktop tasksel texinfo texlive texstudio thunderbird tidy timeshift tmux tor traceroute tzdata ucf udev usbutils util-linux util-linux-extra veracrypt vim vim-common vim-tiny vlc wamerican wget whiptail wireless-tools wpasupplicant wtmpdb wxmaxima xaw3dg-dev xcursor-themes xfce4-pulseaudio-plugin xfce4-whiskermenu-plugin xorg-dev xserver-xorg-video-nouveau xz-utils zlib1g zlib1g-dev zoom zoxide zsh zstd ocrmypdf tesseract-ocr tesseract-ocr-deu libffi-dev
```

## Mac OS

```bash
brew install mise
```

# Installation

```bash
mise install
```

## Dry Run

Perform a dry run of the installation to see what will be updated in your HOME folder:

```bash
./setup --dry-run
```

Examine the output carefully.

## Install dot files

```bash
./setup
```

# General notes

## Editor setup

These dotfiles are configured to provide (nearly) the same environment for all editors / ides (keybinding wise).

Emacs is based on [Doom Emacs](https://github.com/doomemacs/doomemacs).

Here you can find a list of keybindings which are used across some apps (mostly speaking of emacs, vim, jetbrains ides). This might not be up to date though - refer to the respective config files for more up to date information.

| Keybinding         | Description                                             | Available on |
|--------------------|---------------------------------------------------------|--------------|
| `SPC f f`          | Open file                                               | all          |
| `SPC f s`          | Save file                                               | all          |
| `SPC p f`          | Find file in project                                    | all          |
| `SPC SPC`          | Execute command                                         | all          |
| `SPC j i`          | Jump to function / symbol                               | all          |
| `SPC g g`          | Version control                                         | all          |
| `SPC /`            | Search across files                                     | all          |
| `SPC s s`          | Search in current file                                  | all          |
| `SPC c c`          | Compile / Build                                         | all          |
| `SPC ,`            | Select from current position til EOL                    | all          |
| `g d`              | Go to definition                                        | all          |
| `g b`              | Go back                                                 | all          |
| `g f`              | Go forward                                              | all          |
| `R`                | Rename / Refactor                                       | jetbrains    |
| `U`                | Usages / References                                     | all          |
| `-`                | Select current line                                     | all          |
| `SPC o t`          | Open terminal in current file folder                    | all          |
| `SPC w /`          | Split window vertically                                 | all          |
| `SPC w -`          | Split horizontally                                      | all          |
| `SPC w d`          | Delete window                                           | all          |
| `SPC b b`          | Show list of buffers                                    | all          |
| `SPC b n`          | New buffer                                              | all          |
| `SPC b d`          | Delete buffer                                           | all          |
| `SPC RETURN`       | Set bookmark                                            | all          |
| `SPC l b`          | List bookmarks                                          | all          |
| `SPC o f`          | Open corresponding file (e.g. header / source in C/C++) | all          |
| `SPC n o`          | Open notes file                                         | Emacs        |
| `SPC t o`          | Open today's todo file                                  | Emacs        |
| `SPC -`            | Show register / clipboard contents                      | Emacs        |
| `SPC h h`          | Mark whole buffer                                       | all          |
| `SPC z e`          | Open Zettelkasten search                                | Emacs        |
| `SPC c d`          | Open current folder in file manager                     | Emacs        |
| `SPC n t`          | Toggle neotree                                          | Emacs        |
| `SPC c f`          | Format file                                             | all          |
| `SPC ö` or `SPC [` | Search for a string in folder                           | Emacs        |
| `SPC ä` or `SPC ]` | Search for a file in a folder                           | Emacs        |
| `SPC l c`          | Jump to last change                                     | Emacs        |
| `SPC m n`          | Mark this and next occurrence                           | Emacs        |
| `SPC m a`          | Mark all occurrences                                    | Emacs        |
| `SPC h t`          | Change theme                                            | all          |
| `M`                | Enter expand region mode                                | all          |
| `m`                | Expand region                                           | all          |
| `g s s`            | Jump to char (evil-avy-goto-char)                       | Emacs        |

# License

[GPLv3](https://www.gnu.org/licenses/gpl-3.0.txt)

Copyright (C) 2024 pderichs <derichs@posteo.de>

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
