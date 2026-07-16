#!/bin/bash
#
# normalize.sh — crop-to-fill every image to a standard wallpaper size.
#
# Reads every image in this folder (top level) and writes a 2560x1664 version
# into ./normalized/ . Each image is scaled to cover the canvas, then centre-
# cropped, so output is edge-to-edge with no bars (portrait edges get cropped).
# Originals are never modified. Re-runnable: skips images already up to date.
#
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$DIR/normalized"
W=2560
H=1664

mkdir -p "$OUT"
count=0; skipped=0

while IFS= read -r src; do
  base="$(basename "${src%.*}").jpg"
  dst="$OUT/$base"
  # Skip if output exists and is newer than source.
  if [ -f "$dst" ] && [ "$dst" -nt "$src" ]; then
    skipped=$((skipped+1)); continue
  fi
  magick "$src" \
    -auto-orient \
    -resize "${W}x${H}^" \
    -gravity center \
    -extent "${W}x${H}" \
    -quality 88 \
    "$dst"
  count=$((count+1))
  printf "  %s\n" "$base"
done < <(find "$DIR" -maxdepth 1 -type f \
           \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \
           -o -iname '*.heic' -o -iname '*.tiff' \))

echo "done: $count written, $skipped up-to-date -> $OUT"
