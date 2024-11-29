#!/bin/bash

# WALLPAPER_DIR="$HOME/Pictures"
WALLPAPER_DIR="$HOME"
URI="https://www.reddit.com/r/wallpapers/new.json?limit=25"

USERAGENT="Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0"

IMGURL=$(curl -H "User-Agent: $USERAGENT" "$URI"   | jq '.data.children' | jq '.[].data.url' | grep -E "(jpe?g|png)\"$" | sed s/\"//g | sort -R | head -1)
echo "IMG_URL" "$IMGURL"

IMGFILE=$WALLPAPER_DIR/$(printf "%s\n" "${IMGURL##*/}")
echo "IMG_FILE" "$IMGFILE"
curl "$IMGURL" -o ~/wall
