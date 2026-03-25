#!/usr/bin/env bash
set -euo pipefail

SHARE_DIR="/usr/local/share/mac80211-mcs-patch"

echo "Installing mac80211-mcs-patch..."

mkdir -p "$SHARE_DIR"
cp skip-basic-mcs-check.patch "$SHARE_DIR/"
cp rebuild-mac80211.sh "$SHARE_DIR/"
chmod +x "$SHARE_DIR/rebuild-mac80211.sh"

ln -sf "$SHARE_DIR/rebuild-mac80211.sh" /usr/local/bin/rebuild-mac80211

cp 91-mac80211-patch.hook /etc/pacman.d/hooks/

echo "Installed. Running initial build..."
/usr/local/bin/rebuild-mac80211
