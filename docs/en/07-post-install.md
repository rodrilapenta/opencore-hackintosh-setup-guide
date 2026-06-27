# 07 - Post-install

Post-install is hardware-specific.

## Common tasks

- Apply OpenCore Legacy Patcher root patches if required.
- Install Wi-Fi tools such as HeliPort if using `itlwm`.
- Validate audio.
- Validate display acceleration.
- Validate HDMI/DisplayPort.
- Map USB.
- Validate Bluetooth.
- Validate sleep/wake.
- Validate battery.
- Validate camera/card reader/trackpad.

## OCLP

If required:

1. Open OpenCore Legacy Patcher.
2. Choose Post-Install Root Patch.
3. Apply patches.
4. Reboot.
5. Validate graphics acceleration.

## Wi-Fi

If using `itlwm.kext`:

1. Install HeliPort.
2. Open HeliPort.
3. Join Wi-Fi.

If using `AirportItlwm.kext`, Wi-Fi may appear as native AirPort depending on compatibility.
