#!/bin/zsh
# Bootstrap a Mac from these dotfiles. Safe to re-run.
# Usage: git clone https://github.com/ptembra/.dotfiles ~/.dotfiles && ~/.dotfiles/setup.sh
set -euo pipefail

DOT=${0:A:h}
want=$HOME/.dotfiles
# .zshenv hardcodes XDG_CONFIG_HOME=~/.dotfiles, so the repo has to live there
[[ $DOT == ${want:A} ]] || { print -u2 "Clone this repo to ~/.dotfiles first (it's at $DOT)"; exit 1; }

# 1. zsh: ~/.zshenv points ZDOTDIR and XDG_CONFIG_HOME at the repo
if [[ ! ~/.zshenv -ef $DOT/zsh/.zshenv ]]; then
  [[ -e ~/.zshenv || -L ~/.zshenv ]] && mv ~/.zshenv ~/.zshenv.bak && print "Moved old ~/.zshenv to ~/.zshenv.bak"
  ln -s "$DOT/zsh/.zshenv" ~/.zshenv
fi

# 2. GUI apps (Ghostty, AeroSpace) don't read .zshenv; this LaunchAgent sets XDG_CONFIG_HOME for them at login
plist=~/Library/LaunchAgents/xdg_envs.plist
mkdir -p ~/Library/LaunchAgents
cat > $plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>set.xdg_config_home</string>
    <key>ProgramArguments</key>
    <array>
        <string>launchctl</string>
        <string>setenv</string>
        <string>XDG_CONFIG_HOME</string>
        <string>$DOT</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF
launchctl bootout gui/$UID $plist 2>/dev/null || true
launchctl bootstrap gui/$UID $plist

# 3. Homebrew and everything in the Brewfile
if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew bundle --file="$DOT/Brewfile" || print -u2 "Some Brewfile entries failed; fix them and re-run: brew bundle --file=$DOT/Brewfile"

# 4. tmux plugin manager (tmux.conf loads it from ~/.tmux/plugins/tpm)
[[ -d ~/.tmux/plugins/tpm ]] || git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 5. git: XDG_CONFIG_HOME makes git read $DOT/git; these cover processes started without it (cron, other shells)
mkdir -p ~/.config/git
for f in config ignore; do ln -sfn "$DOT/git/$f" ~/.config/git/$f; done

print "Done. Open a new terminal: antidote installs the zsh plugins on first start."
print "In tmux, press C-a then I to install tmux plugins. nvim installs its own plugins on first launch."
