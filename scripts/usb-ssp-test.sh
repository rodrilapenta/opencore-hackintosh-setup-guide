#!/bin/bash
set -euo pipefail

# usb-ssp-test.sh
#
# Generic USB3/SuperSpeed test helper for macOS.
#
# Purpose:
# - Guide the user through testing each physical USB3-capable port.
# - Capture speed, Location ID, disk info, and visible HS/SSP ports.
# - Save a log for USB mapping.
#
# This script does not modify EFI, kexts, config.plist, or system settings.

OUT="$HOME/Desktop/USB-MAPPING-SESSION"
mkdir -p "$OUT"

LOG="$OUT/usb-ssp-test-$(date +%Y%m%d-%H%M%S).txt"

clear
echo "USB3 / SuperSpeed test helper"
echo "============================="
echo
echo "This script tests physical USB ports with a known-good USB3 storage device."
echo
echo "Use this for SS/SSP discovery during USB mapping."
echo
echo "Important:"
echo "- Use a known-good USB3 external disk or enclosure if possible."
echo "- Some USB3 flash drives negotiate as USB2 on some machines."
echo "- If a device shows 'Speed: Up to 480 Mb/s', it is using USB2/HS."
echo "- If a device shows 'Speed: Up to 5 Gb/s', it is using USB3/SuperSpeed."
echo "- This script does not change your system."
echo
echo "Output log:"
echo "$LOG"
echo

read -r -p "Press ENTER to start..."

{
  echo "USB3 / SuperSpeed test helper"
  echo "Date: $(date)"
  echo "Host: $(hostname)"
  echo "============================================"
} >> "$LOG"

while true; do
  clear
  echo "------------------------------------------------------------"
  echo "USB3 / SuperSpeed test"
  echo "------------------------------------------------------------"
  echo
  read -r -p "Physical port label to test, or q to quit: " LABEL

  if [[ "$LABEL" == "q" || "$LABEL" == "Q" ]]; then
    break
  fi

  if [ -z "$LABEL" ]; then
    echo "Empty label. Try again."
    sleep 1
    continue
  fi

  echo
  echo "Disconnect the USB3 test device."
  read -r -p "Press ENTER when disconnected..."

  echo
  echo "Connect the USB3 test device to:"
  echo
  echo "  >>> $LABEL <<<"
  echo
  echo "Wait 8-10 seconds after connecting."
  read -r -p "Press ENTER when connected..."

  TMP="$OUT/current-usb-${LABEL//\//_}.txt"
  system_profiler SPUSBDataType > "$TMP"

  {
    echo
    echo "============================================================"
    echo "TIME: $(date)"
    echo "LABEL: $LABEL"
    echo "------------------------------------------------------------"
    echo "DISKUTIL:"
    diskutil list | grep -A 8 -B 2 -Ei "external|NO NAME|DataTraveler|Kingston|My Passport|Western|WD|SanDisk|Samsung|Seagate|Generic|disk[0-9]" || true
    echo
    echo "SYSTEM_PROFILER USB MATCH:"
    grep -A 40 -B 8 -Ei "Mass Storage|Flash|Disk|Kingston|SanDisk|Samsung|WD|Western|Seagate|Generic|DataTraveler|My Passport|5 Gb|10 Gb|480 Mb|Speed|Location ID" "$TMP" || true
    echo
    echo "IOREG HS/SSP PORTS:"
    ioreg -p IOService -w0 | grep -Ei "HS0[1-9]@|HS1[0-9]@|HS2[0-9]@|SSP[0-9]@|SS[0-9]@|AppleUSB30XHCIPort|AppleUSB20XHCIPort" || true
    echo "============================================================"
  } >> "$LOG"

  echo
  echo "Quick result for: $LABEL"
  echo "------------------------------------------------------------"
  grep -A 35 -B 8 -Ei "Mass Storage|Flash|Disk|Kingston|SanDisk|Samsung|WD|Western|Seagate|Generic|DataTraveler|My Passport|5 Gb|10 Gb|480 Mb|Speed|Location ID" "$TMP" || true
  echo
  echo "Interpretation:"
  echo "- 'Speed: Up to 5 Gb/s' or higher = SuperSpeed/USB3 path is working."
  echo "- 'Speed: Up to 480 Mb/s' = device fell back to USB2/HS."
  echo "- No device shown = the port did not enumerate the test device."
  echo
  echo "Saved to:"
  echo "$LOG"
  echo
  echo "Eject the disk from Finder/diskutil if it mounted, then disconnect it."
  read -r -p "Press ENTER to continue..."
done

clear
echo "Done."
echo
echo "Log saved to:"
echo "$LOG"
echo
echo "Review labels that showed 5 Gb/s. Those are the physical ports with working USB3/SuperSpeed."
