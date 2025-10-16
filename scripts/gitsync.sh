#!/usr/bin/env bash

BASE_DIR="$HOME/code"

for dir in "$BASE_DIR"/*; do
  if [ -d "$dir/.git" ]; then
    echo "Updating $(basename "$dir")"
    git -C "$dir" pull --ff-only
  fi
done
