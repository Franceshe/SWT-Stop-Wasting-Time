#!/bin/zsh

# Move the activity log to the time analysis dir and run analysis on it

DIR="$HOME/time-analysis"
FILE="$HOME/Documents/activity.txt"

if [ ! -d "$DIR" ]; then
  mkdir "$DIR"
fi

d=`date '+%y-%m-%d'`
`dirname .`/time-analysis.sh > $DIR/$d.txt
mv "$FILE" "$DIR/$d.raw.txt"