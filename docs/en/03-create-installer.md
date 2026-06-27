# 03 - Create the macOS installer USB

This workflow uses an OpenCore online/recovery installer style USB.

The USB contains:

```text
EFI/
com.apple.recovery.boot/
```

`EFI/` comes from your generated OpenCore EFI.

`com.apple.recovery.boot/` contains the Apple Recovery/BaseSystem files downloaded with OpenCorePkg's `macrecovery`.

## 1. Download OpenCorePkg

Get OpenCorePkg from:

```text
https://github.com/acidanthera/OpenCorePkg
```

You need the `Utilities/macrecovery/` folder.

## 2. Choose the macOS version

Open:

```text
Utilities/macrecovery/recovery_urls.txt
```

or check it online:

```text
https://github.com/acidanthera/OpenCorePkg/blob/master/Utilities/macrecovery/recovery_urls.txt
```

Choose the entry/version you want to install.

The best macOS version depends on your hardware. Older hardware may require OpenCore Legacy Patcher, and some combinations are not worth targeting.

## 3. Download Recovery/BaseSystem with macrecovery

From the `Utilities/macrecovery/` folder, run the command for the macOS version you chose.

The exact arguments depend on the entry in `recovery_urls.txt`.

A typical macrecovery flow looks like:

```bash
python3 macrecovery.py -b <BOARD_ID> -m <MLB_OR_PRODUCT_ID> download
```

This should download files such as:

```text
BaseSystem.dmg
BaseSystem.chunklist
```

Create a folder named:

```text
com.apple.recovery.boot
```

and place the downloaded BaseSystem files there if the tool did not already create the structure.

## 4. Prepare the USB drive

Use Rufus, Disk Utility, `diskpart`, `diskutil`, or another tool.

Recommended layout:

```text
Partition scheme: GPT
Filesystem: FAT32
```

The USB root should end up containing:

```text
EFI/
com.apple.recovery.boot/
```

## 5. Build the EFI with OpCore-Simplify

Use OpCore-Simplify from:

```text
https://github.com/lzhoang2801/OpCore-Simplify
```

Run the hardware detection/build flow and generate your first EFI.

The generated EFI is a baseline. It is not guaranteed to be final.

## 6. Copy files to the USB

Copy your generated EFI folder to the USB root:

```text
EFI/
```

Copy the recovery folder to the USB root:

```text
com.apple.recovery.boot/
```

Expected USB root:

```text
USB_ROOT/
  EFI/
    BOOT/
    OC/
  com.apple.recovery.boot/
    BaseSystem.dmg
    BaseSystem.chunklist
```

## 7. Boot from the USB

Boot the target computer from the USB.

Choose OpenCore, then choose the macOS Recovery/BaseSystem installer entry.

## Notes

The installer may show inaccurate time estimates. It may claim it will take hours, but the actual first stage can be much shorter.

Do not interrupt the install only because the estimate looks wrong. It may reboot several times.
