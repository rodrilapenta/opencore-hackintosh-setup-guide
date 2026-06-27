# 05 - Boot and install macOS

## Steps

1. Boot from the USB drive.
2. Choose OpenCore.
3. Choose the macOS installer.
4. Format the target disk if needed.
5. Start installation.
6. Let the installer reboot as many times as required.
7. On each reboot, boot through OpenCore again.
8. Continue the install until macOS setup appears.

## Notes

The installer may show inaccurate time estimates.

The installation can look stuck for a while. Be patient unless there is a clear kernel panic or reboot loop.

## After first boot

Once macOS boots:

1. Skip Apple ID for now if SMBIOS is not validated.
2. Reach the Desktop.
3. Continue with internal OpenCore installation.
