#!/bin/bash
#
# wallpaper-collection.sh — turn this folder into a rotating wallpaper "collection".
#
# macOS 26 has no supported command to register a native folder-collection with
# rotation, so this reproduces that behaviour with a launchd agent that reshuffles
# the desktop picture on an interval and at login.
#
# Usage:
#   ./wallpaper-collection.sh install [interval_seconds]   # default 3600 (1h)
#   ./wallpaper-collection.sh next                          # set a new random image now
#   ./wallpaper-collection.sh uninstall                     # stop and remove the agent
#
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LABEL="com.parham.wallpaper-collection"
PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"
LOG="$HOME/Library/Logs/$LABEL.log"

pick_and_set() {
  local img src
  # Prefer normalized/ (uniform 2560x1664 copies) when it exists; else the folder.
  src="$DIR"; [ -d "$DIR/normalized" ] && src="$DIR/normalized"
  img="$(find "$src" -type f \
          \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \
          -o -iname '*.heic' -o -iname '*.gif' -o -iname '*.tiff' \) \
        | sort -R | head -n1)"
  [ -z "$img" ] && { echo "no images found in $DIR" >&2; exit 1; }
  osascript -e "tell application \"System Events\" to set picture of every desktop to \"$img\""
  echo "$(date '+%Y-%m-%d %H:%M:%S')  $img"
}

case "${1:-install}" in
  next)
    pick_and_set
    ;;

  install)
    interval="${2:-3600}"
    cat > "$PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>            <string>$LABEL</string>
    <key>ProgramArguments</key>
    <array>
        <string>$DIR/wallpaper-collection.sh</string>
        <string>next</string>
    </array>
    <key>RunAtLoad</key>       <true/>
    <key>StartInterval</key>   <integer>$interval</integer>
    <key>StandardOutPath</key> <string>$LOG</string>
    <key>StandardErrorPath</key><string>$LOG</string>
</dict>
</plist>
EOF
    launchctl unload "$PLIST" 2>/dev/null || true
    launchctl load "$PLIST"
    echo "installed: rotating every ${interval}s (log: $LOG)"
    pick_and_set
    ;;

  uninstall)
    launchctl unload "$PLIST" 2>/dev/null || true
    rm -f "$PLIST"
    echo "uninstalled"
    ;;

  *)
    echo "usage: $0 [install [interval_seconds] | next | uninstall]" >&2
    exit 1
    ;;
esac
