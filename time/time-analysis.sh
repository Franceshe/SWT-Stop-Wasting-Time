#!/bin/zsh

# Analyze an activity file. Supply file as arg, otherwise it assumes Documents/activity.txt

FILE=$1
if ! [ -n $FILE ]; then
  FILE="$HOME/Documents/activity.txt"
fi

echo "==Applications (minutes)=="
cat "$FILE" | grep -v Screensaver | awk '{print $2}' | sort | uniq -c | sort -r | head -10

echo

echo "==Sites (minutes)=="
cat "$FILE" | grep Safari | awk '{print $3}' | cut -d '/' -f 3 | sort | uniq -c | sort -r | head -10

