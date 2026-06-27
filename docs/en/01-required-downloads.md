# 01 - Required downloads

This repo does not bundle third-party tools or macOS.

Download what you need separately.

## Required

### OpenCore

OpenCore is the bootloader. You will use it directly or through tools that generate an OpenCore EFI.

### OpenCore Simplify

Used in this workflow to generate the first EFI based on detected hardware.

Treat it as a baseline generator. You still need to validate and adjust the EFI.

### macOS installer

Use a legitimate Apple source to obtain macOS.

The correct macOS version depends on your hardware.

General guidance:

- Newer hardware: use a currently supported macOS version.
- Older Intel hardware: check OpenCore Legacy Patcher support before choosing.
- Very old GPUs/Wi-Fi: expect OCLP or hardware replacement.

Do not download random modified macOS images.

### ProperTree or plist editor

Used to inspect and edit `config.plist`.

### OpenCore Legacy Patcher

Required only when your hardware needs legacy patches.

Common cases:

- Legacy Intel iGPU acceleration.
- Unsupported Wi-Fi.
- Running newer macOS on older hardware.

### HeliPort

Required when using `itlwm.kext` for Intel Wi-Fi.

If using `AirportItlwm.kext`, HeliPort may not be needed.

### USBToolBox

Used to create a final USB map.

This repo includes helper scripts for discovering and validating ports, but the final map is machine-specific.

## Not included by design

This repo does not include:

- macOS.
- EFIs.
- SMBIOS values.
- OCLP app bundle.
- HeliPort app bundle.
- OpenCore Simplify binary.
