#!/bin/bash

echo "=== Kexts relevant ==="
kmutil showloaded | grep -Ei "Lilu|VirtualSMC|WhateverGreen|AppleALC|USBToolBox|UTB|XHCI|Realtek|itlwm|AirportItlwm|Bluetooth|BlueToolFixup|Voodoo|RestrictEvents|FeatureUnlock|AMFIPass" || true

echo
echo "=== USB ports ==="
ioreg -p IOService -w0 | grep -Ei "HS0[1-9]@|HS1[0-4]@|SSP[0-9]@|AppleUSB30XHCIPort|AppleUSB20XHCIPort" || true

echo
echo "=== Hardware ports ==="
networksetup -listallhardwareports || true

echo
echo "=== Displays ==="
system_profiler SPDisplaysDataType

echo
echo "=== Audio ==="
system_profiler SPAudioDataType

echo
echo "=== USB ==="
system_profiler SPUSBDataType

echo
echo "=== Bluetooth ==="
system_profiler SPBluetoothDataType

echo
echo "=== Storage/SATA ==="
system_profiler SPSerialATADataType
