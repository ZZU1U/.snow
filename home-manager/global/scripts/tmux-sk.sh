#!/usr/bin/env bash

sessions=$(tmux list-sessions -F "#{session_name} [#{session_windows}] #{session_path}" 2>/dev/null)

if [ -z "$sessions" ]; then
  tmux new-session
  exit 0
fi

sessions_with_new="new\n$sessions"

selected=$(echo -e "$sessions_with_new" | sk)

selected_session=$(echo "$selected" | cut -d ' ' -f 1)

if [ -z "$selected" ]; then
  echo "No session selected"
  exit 1
elif [ "$selected" = "new" ]; then
  tmux new-session
else
  tmux attach-session -t "$selected_session"
fi

