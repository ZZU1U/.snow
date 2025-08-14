#!/usr/bin/env bash

# Get list of existing tmux sessions
sessions=$(tmux list-sessions -F "#{session_name} [#{session_windows}] #{session_path}" 2>/dev/null)

# If no sessions exist, create a new one
if [ -z "$sessions" ]; then
  tmux new-session
  exit 0
fi

# Add "Create new session" option to the list
sessions_with_new="Create new session\n$sessions"

# Use fzf to select a session
selected=$(echo -e "$sessions_with_new" | sk)

selected_session=$(echo "$selected" | cut -d ' ' -f 1)

# Handle the selection
if [ -z "$selected" ]; then
  echo "No session selected"
  exit 1
elif [ "$selected" = "Create new session" ]; then
  tmux new-session
else
  tmux attach-session -t "$selected_session"
fi
