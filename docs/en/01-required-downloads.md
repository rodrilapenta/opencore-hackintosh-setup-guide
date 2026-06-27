# 01 - Required downloads

This repo does not bundle third-party tools, private EFIs, SMBIOS values, or macOS.

Download what you need separately.

## Required tools

### OpenCorePkg

Official repository:

```text
https://github.com/acidanthera/OpenCorePkg
```

You need OpenCorePkg for:

- OpenCore release files.
- OpenCore utilities.
- `macrecovery`, used to download Apple Recovery/BaseSystem files.

Inside OpenCorePkg, `macrecovery` lives under:

```text
Utilities/macrecovery/
```

The recovery catalog/reference file is:

```text
Utilities/macrecovery/recovery_urls.txt
```

Online reference:

```text
https://github.com/acidanthera/OpenCorePkg/blob/master/Utilities/macrecovery/recovery_urls.txt
```

### OpCore-Simplify

Official repository:

```text
https://github.com/lzhoang2801/OpCore-Simplify
```

Use OpCore-Simplify to generate the first EFI based on your hardware.

Important: OpCore-Simplify creates a starting point. You still need to validate and fix the EFI for your exact machine.

### macOS Recovery / BaseSystem files

This workflow uses OpenCorePkg's `macrecovery` tool to download Apple's Recovery/BaseSystem files for a chosen macOS version.

The exact command depends on the macOS version/identifier you choose from `recovery_urls.txt`.

The output normally includes files such as:

```text
BaseSystem.dmg
BaseSystem.chunklist
```

These are placed inside a USB folder named:

```text
com.apple.recovery.boot
```

### USB formatting tool

You need a tool to prepare the installer USB.

Examples:

- Rufus on Windows.
- Disk Utility on macOS.
- `diskpart` on Windows.
- `diskutil` on macOS.

Recommended target layout for this workflow:

```text
Partition scheme: GPT
Filesystem: FAT32
```

The USB must contain:

```text
EFI/
com.apple.recovery.boot/
```

### ProperTree or another plist editor

Used to inspect or edit `config.plist`.

Always keep backups.

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
- OpCore-Simplify binary/app.
- OpenCorePkg release binaries.
