#!/bin/bash
set -euo pipefail

# usb-watch-simple.sh
#
# Generic USB discovery helper for macOS.
#
# Purpose:
# - Capture a baseline USB tree.
# - Ask the user to plug one USB device into one physical port.
# - Capture the new USB tree.
# - Print the new/different device block.
# - Save a log.
#
# This script does not modify EFI, kexts, config.plist, or system settings.

OUT="$HOME/Desktop/USB-MAPPING-SESSION"
mkdir -p "$OUT"

LOG="$OUT/usb-detections-simple.txt"
BEFORE="$OUT/usb-before.txt"
AFTER="$OUT/usb-after.txt"

clear
echo "USB simple discovery helper"
echo "==========================="
echo
echo "This script helps identify which logical USB port changes when you plug a device."
echo
echo "Recommended use:"
echo "- Use a simple USB2 device for HS/USB2 discovery, such as a mouse dongle."
echo "- Plug only ONE test device at a time."
echo "- Give each physical port a clear label, for example:"
echo "  LEFT-NEAR, LEFT-FAR, RIGHT-NEAR, RIGHT-FAR, FRONT-TOP, REAR-BOTTOM."
echo
echo "Output folder:"
echo "$OUT"
echo
echo "This script does not change your system."
echo

while true; do
  echo "------------------------------------------------------------"
  read -r -p "Physical port label, or q to quit: " LABEL

  if [[ "$LABEL" == "q" || "$LABEL" == "Q" ]]; then
    echo "Done."
    exit 0
  fi

  if [ -z "$LABEL" ]; then
    echo "Empty label. Try again."
    continue
  fi

  echo
  echo "Disconnect the test USB device from all ports."
  read -r -p "Press ENTER when disconnected..."

  system_profiler SPUSBDataType > "$BEFORE"

  echo
  echo "Now connect the test USB device to:"
  echo
  echo "  >>> $LABEL <<<"
  echo
  echo "Wait 5-10 seconds after connecting."
  read -r -p "Press ENTER when connected..."

  system_profiler SPUSBDataType > "$AFTER"

  echo
  echo "Detected changes for: $LABEL"
  echo "------------------------------------------------------------"

  {
    echo
    echo "============================================================"
    echo "TIME: $(date)"
    echo "LABEL: $LABEL"
    echo "------------------------------------------------------------"
    echo "DIFF:"
    diff -u "$BEFORE" "$AFTER" || true
    echo "============================================================"
  } >> "$LOG"

  diff -u "$BEFORE" "$AFTER" | sed -n '/^+[^+]/p' | sed 's/^+//' | head -80 || true

  echo
  echo "Saved to:"
  echo "$LOG"
  echo
  echo "Disconnect the test USB device."
  read -r -p "Press ENTER to continue..."
  echo
done
