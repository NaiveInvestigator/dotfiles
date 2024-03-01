#!/bin/bash

# Get a random file from ~/Pictures
random_file=$(find -L ~/Pictures -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)

# Check if a file was selected
if [[ -z "$random_file" ]]; then
    exit 0
fi

# Execute material.py with the random file
~/.config/eww/scripts/material.py --image "$random_file"

