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

If `~/.config/nvim` already exists, move or back it up first, otherwise `ln` creates the link inside it.

## Saving changes

Because the live files are symlinks, editing `~/.tmux.conf`, `~/.claude/statusline-tmux.sh` or anything under `~/.config/nvim` changes this repo directly. Nothing is committed or pushed automatically:

```sh
git -C ~/dotty-dolphin add -A
git -C ~/dotty-dolphin commit -m "Describe the change"
git -C ~/dotty-dolphin push
```

lazy.nvim rewrites `nvim/lazy-lock.json` whenever plugins are installed or updated, so expect it to show up in `git status`. Commit it to keep plugin versions pinned across machines.
