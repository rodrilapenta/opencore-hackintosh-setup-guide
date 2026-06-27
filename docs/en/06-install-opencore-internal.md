# 06 - Copy OpenCore to the internal disk

After macOS boots from the USB OpenCore, install OpenCore to the internal disk.

## Steps

1. Mount the internal EFI partition.
2. Back up any existing EFI.
3. Copy your working EFI to the internal EFI partition.
4. Reboot.
5. Choose the internal OpenCore entry.
6. Reset NVRAM once after major EFI changes.
7. Boot macOS from the internal disk.

## Why

Without this step, the system depends on the USB drive to boot.
