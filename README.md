# dotty-dolphin

Personal dotfiles. The live config files are symlinks into this repo, so edits land here directly.

## tmux (`tmux/.tmux.conf`)

Nord++ theme via TPM, plus tmux-battery, tmux-pomodoro-plus, tmux-resurrect and tmux-continuum.

```sh
ln -sf ~/dotty-dolphin/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf   # then prefix + I to install plugins
```

Needs a Nerd Font in the terminal for the Powerline glyphs.

## Claude Code context usage (`claude/statusline-tmux.sh`)

Publishes Claude Code's context usage to the tmux pane, shown at the right of the status bar.

```sh
ln -sf ~/dotty-dolphin/claude/statusline-tmux.sh ~/.claude/statusline-tmux.sh
```

and in `~/.claude/settings.json`:

```json
"statusLine": { "type": "command", "command": "~/.claude/statusline-tmux.sh" }
```

Requires `jq`.

## Neovim (`nvim/`)

`init.lua` with lazy.nvim; `lazy-lock.json` pins plugin versions.

```sh
ln -s ~/dotty-dolphin/nvim ~/.config/nvim
```
