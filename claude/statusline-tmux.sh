#!/usr/bin/env bash
# Claude Code statusLine command: publishes context usage to the tmux pane
# (@claude_ctx / @claude_ctx_colour, read by status-right in ~/.tmux.conf)
# and prints a short status line for Claude Code itself.
input=$(cat)
pct=$(jq -r '.context_window.used_percentage // 0 | floor' <<<"$input")
model=$(jq -r '.model.display_name // empty' <<<"$input")

if (( pct >= 80 )); then colour=red
elif (( pct >= 50 )); then colour=yellow
else colour=green
fi

if [[ -n $TMUX_PANE ]]; then
  tmux set -p -t "$TMUX_PANE" @claude_ctx "$pct" \; \
       set -p -t "$TMUX_PANE" @claude_ctx_colour "$colour" 2>/dev/null
fi

echo "${model:+$model · }ctx ${pct}%"
