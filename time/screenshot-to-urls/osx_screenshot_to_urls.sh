#!/bin/zsh
mkdir -p $HOME/Library/LaunchAgents
dir="$HOME/Library/Watchpics"
beep="/System/Library/PrivateFrameworks/ScreenReader.framework/Versions/A/Resources/Sounds/Ellipsis.aiff"
cat > $HOME/Library/LaunchAgents/watchpics.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Disabled</key>
<false/>
<key>Label</key>
<string>com.avibryant.watchpics</string>
<key>ProgramArguments</key>
<array>
<string>$dir/watchpics</string>
</array>
<key>WatchPaths</key>
<array>
<string>$HOME/Desktop/Picture 1.png</string>
</array>
<key>RunAtLoad</key>
<true/>
<key>onDemand</key>
<true/>
</dict>
</plist>
EOF
mkdir -p $dir
cat > $dir/watchpics <<EOF
#!/bin/sh
#edit these
REMOTE_USER=youruser
REMOTE_SERVER=yourserver.com
REMOTE_PATH=path/to/pics
REMOTE_URL=http://yourserver.com/pics
####
sleep 1
PIC=~/Desktop/Picture\ 1.png
if [ -f ~/Desktop/Picture\ 1.png ]
then
MD5=\`md5 "\$PIC" | cut -d " " -f 5\`
scp ~/Desktop/Picture\ 1.png \$REMOTE_USER@\$REMOTE_SERVER￼\$REMOTE_PATH/\$MD5.png
rm "\$PIC"
echo "\$REMOTE_URL/\$MD5.png\c" | pbcopy
afplay "$beep"
fi
EOF
chmod u+x $dir/watchpics
launchctl load -S Aqua $HOME/Library/LaunchAgents/watchpics.plist
echo "Please edit the REMOTE_* variables at the top of $dir/watchpics"
