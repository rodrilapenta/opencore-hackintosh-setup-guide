#!/bin/bash
set -euo pipefail

OUT="$HOME/Desktop/hackintosh-hardware-report-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$OUT"

system_profiler SPHardwareDataType > "$OUT/SPHardwareDataType.txt" 2>&1 || true
system_profiler SPDisplaysDataType > "$OUT/SPDisplaysDataType.txt" 2>&1 || true
system_profiler SPAudioDataType > "$OUT/SPAudioDataType.txt" 2>&1 || true
system_profiler SPUSBDataType > "$OUT/SPUSBDataType.txt" 2>&1 || true
system_profiler SPSerialATADataType > "$OUT/SPSerialATADataType.txt" 2>&1 || true
system_profiler SPEthernetDataType > "$OUT/SPEthernetDataType.txt" 2>&1 || true
system_profiler SPBluetoothDataType > "$OUT/SPBluetoothDataType.txt" 2>&1 || true
system_profiler SPCameraDataType > "$OUT/SPCameraDataType.txt" 2>&1 || true
system_profiler SPCardReaderDataType > "$OUT/SPCardReaderDataType.txt" 2>&1 || true
system_profiler SPPowerDataType > "$OUT/SPPowerDataType.txt" 2>&1 || true
networksetup -listallhardwareports > "$OUT/network-hardware-ports.txt" 2>&1 || true
ioreg -l > "$OUT/ioreg-full.txt" 2>&1 || true
kmutil showloaded > "$OUT/kmutil-showloaded.txt" 2>&1 || true

echo "Hardware report saved to:"
echo "$OUT"
