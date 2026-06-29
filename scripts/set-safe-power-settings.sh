#!/bin/bash
set -euo pipefail

# Conservative Hackintosh power settings.
#
# Use this when:
# - Display sleep works.
# - Manual sleep works.
# - Automatic idle system sleep black-screens or fails to wake.
#
# This allows the display to turn off, but disables automatic full system sleep.

echo "Applying conservative Hackintosh power settings..."

sudo pmset -c displaysleep 10
sudo pmset -c sleep 0
sudo pmset -c disksleep 10

sudo pmset -b displaysleep 5
sudo pmset -b sleep 0
sudo pmset -b disksleep 10

sudo pmset -a hibernatemode 0
sudo pmset -a standby 0
sudo pmset -a autopoweroff 0
sudo pmset -a powernap 0
sudo pmset -a tcpkeepalive 0
sudo pmset -a proximitywake 0
sudo pmset -a womp 0

echo
echo "Current settings:"
pmset -g custom
echo
echo "Done."
