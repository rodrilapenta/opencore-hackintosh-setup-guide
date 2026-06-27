# 03 - Create the macOS installer

Create a macOS installer USB using a legitimate Apple source.

## General steps

1. Download the macOS installer.
2. Prepare a USB drive.
3. Create the installer.
4. Mount the USB EFI partition.
5. Copy your generated EFI to the USB EFI partition.

## Important

The USB installer has two separate things:

1. The macOS installer volume.
2. The EFI partition containing OpenCore.

You need both.

## Expected install time

macOS may show very inaccurate estimates, sometimes several hours.

In practice, the first stage may be much shorter than the estimate, but the installer can reboot multiple times.

Do not interrupt it just because the time estimate looks wrong.
