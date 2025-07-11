#!/usr/bin/env bash

# Get CMUS status
status=$(cmus-remote -Q 2>/dev/null)

# Parse status line
state=$(echo "$status" | awk '/^status / { print $2 }')

# If CMUS is running and a track is selected
if [[ "$state" == "playing" || "$state" == "paused" ]]; then
    artist=$(echo "$status" | awk -F ' ' '/^tag artist / { $1=$2=""; print substr($0,3) }')
    title=$(echo "$status" | awk -F ' ' '/^tag title / { $1=$2=""; print substr($0,3) }')

    if [[ "$state" == "playing" ]]; then
        state=">"
    else
        state="-"
    fi

    echo "($state) $artist - $title"
elif [[ "$state" == "stopped" ]]; then
    echo "[-]"
else
    echo ""  # CMUS not running or no track loaded
fi

