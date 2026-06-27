# 02 - Hardware discovery

Before creating an EFI, identify your hardware.

You need:

- CPU model and generation.
- iGPU.
- dGPU.
- Wi-Fi chipset.
- Bluetooth chipset.
- Ethernet chipset.
- Audio codec.
- Storage controller.
- USB controller.
- Trackpad/keyboard type.
- Camera.
- Card reader.
- Display outputs.
- BIOS settings.

## If macOS already boots

Run:

```bash
./scripts/00-collect-hardware.sh
```

It creates a folder on Desktop with hardware reports.

## If macOS does not boot yet

Use Windows or Linux tools:

- Device Manager.
- HWiNFO.
- Linux `lspci`.
- Linux `lsusb`.
- Linux `inxi`.

## Why this matters

Every hardware component affects EFI decisions:

- GPU affects SMBIOS, boot-args, WhateverGreen and OCLP.
- Wi-Fi affects `itlwm`, `AirportItlwm`, HeliPort or OCLP.
- Audio affects AppleALC layout-id.
- USB requires a machine-specific map.
- Trackpads may require PS2, I2C, RMI or other kexts.
