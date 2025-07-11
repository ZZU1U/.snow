#!/usr/bin/env bash

# Script to open pdf into new sioyek

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    fd . ~/downloads ~/documents/notes ~/documents/ --min-depth 1 --max-depth 2 -e "pdf" |
      sed "s|^$HOME/||" |
      fzf
  )
  # Add home path back
  if [[ -n "$selected" ]]; then
    selected="$HOME/$selected"
  fi
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)

sioyek --new-window "$selected" >>/dev/null &
