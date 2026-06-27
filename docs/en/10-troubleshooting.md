# 10 - Troubleshooting

## USB3 devices show only 480 Mb/s

1. Use a known-good USB3 disk.
2. Check BIOS xHCI/USB3 settings.
3. Compare with and without USBToolBox/USB map.
4. Check if `AppleUSB30XHCIPort` or `SSP` ports exist.
5. Rebuild the map under the 15-port limit.

## No GPU acceleration

Check:

- SMBIOS.
- WhateverGreen.
- boot-args.
- OCLP root patches.
- Unsupported dGPU status.

## No Wi-Fi

Check:

- `itlwm` + HeliPort.
- `AirportItlwm`.
- OCLP Wi-Fi patches.
- Whether the Wi-Fi chipset is supported at all.

## Optical drive detected but no media

A SATA/ATAPI optical drive can be detected by macOS but fail to read media because of:

- dirty lens.
- weak laser.
- old mechanism.
- bad disc.
