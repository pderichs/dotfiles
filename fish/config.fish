# Umgebungsvariablen
set -gx EDITOR "nvim"
set -gx VISUAL $EDITOR
set -gx PAGER "less"

# PATH erweitern
fish_add_path ~/bin
fish_add_path ~/.local/bin
fish_add_path ~/.npm-global/bin

# Keine Greeting-Message
set -g fish_greeting

# Abbreviations (besser als Aliase – werden beim Tippen expandiert)
abbr -a g git
abbr -a ga "git add"
abbr -a gc "git commit"
abbr -a gp "git push"
abbr -a gd "git diff"
abbr -a gs "git status"

abbr -a dc "docker compose"
abbr -a k kubectl

# npm/pnpm
abbr -a nr "npm run"
abbr -a ni "npm install"

# Vi-Mode
# fish_vi_key_bindings

# Oder Emacs-Mode
# fish_default_key_bindings

# Bessere Directory-Navigation
set -g fish_autosuggestion_enabled 1  # Default, aber explizit

# History-Einstellungen
set -g fish_history_max 10000

# GPG
set -gx GPG_TTY (tty)

# Optional für Laptop
# set -gx PD_LAPTOP 1

# Greeting deaktivieren
set -g fish_greeting

# zoxide
zoxide init fish | source

# fzf Key Bindings
fzf --fish | source

# Caps Lock deaktivieren (Linux)
if test (uname) = "Linux"
    setxkbmap -option caps:none 2>/dev/null
end

# Lokale Anpassungen
if test -f ~/rc.local.fish
  source ~/rc.local.fish
end
