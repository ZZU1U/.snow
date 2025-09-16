#!/usr/bin/env fish

echo (rmpc song | jq -r '"\(.metadata.artist) - \(.metadata.title)"')
