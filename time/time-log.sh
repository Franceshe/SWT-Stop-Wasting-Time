#!/bin/zsh

# Every 60 secs, write info about frontmost app to Documents/activity.txt

FILE="$HOME/Documents/activity.txt"

while true
do
  if ( ps ax | grep -i screensaver | grep -v grep >/dev/null); then
    app='Screensaver'
  else
    app=`osascript -e 'tell application "System Events"
      set frontmostApplication to name of the first process whose frontmost is true
    end tell
    frontmostApplication'`
  fi

  echo -n `date "+%s"` $app "" >> "$FILE"

  if ( echo $app | grep Safari >/dev/null); then
    url=`osascript -e 'tell application "Safari"
      set thisPage to do JavaScript "document.URL" in document 1
    end tell'`
    echo $url >> "$FILE"
  else
    echo >> $FILE
  fi

  sleep 60
done