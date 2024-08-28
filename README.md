# dotfiles

My dotfiles.

Installation notes can be found at [INSTALL.org](https://github.com/pderichs/dotfiles/blob/main/INSTALL.md).

# General notes

These dotfiles are configured to provide (nearly) the same environment for all editors / ides (keybinding wise).

Here you can find a list of keybindings which are used across some apps (mostly speaking of emacs, vim, jetbrains ides). This might not be up to date though - refer to the respective config files for more up to date information.

| Keybinding         | Description                                             | Available on |
|--------------------|---------------------------------------------------------|--------------|
| `SPC p f`          | Open file in project                                    | all          |
| `SPC SPC`          | Execute command                                         | all          |
| `SPC j i`          | Jump to function / symbol                               | all          |
| `SPC g g`          | Version control                                         | all          |
| `SPC /`            | Search across files                                     | all          |
| `SPC s s`          | Search in current file                                  | all          |
| `SPC c c`          | Compile                                                 | all          |
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
| `M`                | Enter expand region mode                                | all          |
| `m`                | Expand region                                           | all          |

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
