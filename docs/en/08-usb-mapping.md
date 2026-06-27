# 08 - USB mapping

USB mapping is mandatory for a stable Hackintosh.

## What to understand

A physical USB 3.x Type-A port normally has two logical sides:

- **HS**: USB2 side.
- **SS/SSP**: USB3 SuperSpeed side.

Internal devices can also use USB ports:

- Bluetooth.
- Webcam.
- Fingerprint reader.
- Touchscreen.
- Internal card reader.

## What this repo can do generically

This repo can help you discover and document ports.

It cannot generate a perfect universal USB map because the final map is machine-specific.

## Scripts included

### HS / USB2 discovery

Use:

```bash
./scripts/usb-watch-simple.sh
```

Recommended device:

- USB2 mouse dongle.
- Simple USB2 flash drive.
- Any reliable USB2 device.

What it does:

1. Takes a baseline USB tree.
2. Asks you to connect one device to one physical port.
3. Captures the new USB tree.
4. Shows the difference.
5. Saves a log to Desktop.

Use this to map the HS side of physical ports.

### SS / USB3 SuperSpeed discovery

Use:

```bash
./scripts/usb-ssp-test.sh
```

Recommended device:

- Known-good USB3 external disk.
- Known-good USB3 enclosure.

Avoid relying on a random USB3 flash drive. Some USB3 flash drives negotiate as USB2 on specific machines.

What it does:

1. Asks for a physical port label.
2. Asks you to connect the USB3 device.
3. Captures speed, Location ID, disk info and IORegistry ports.
4. Saves a log to Desktop.

Use this to identify which physical ports negotiate at:

```text
Speed: Up to 5 Gb/s
```

or higher.

If a port only shows:

```text
Speed: Up to 480 Mb/s
```

then the device is using USB2/HS, not USB3.

## Suggested physical labels

Use labels that make sense for your machine:

```text
LEFT-NEAR
LEFT-FAR
RIGHT-NEAR
RIGHT-FAR
FRONT-TOP
FRONT-BOTTOM
REAR-TOP
REAR-BOTTOM
USB-C-LEFT
USB-C-RIGHT
```

## What to do if USB3 is not detected correctly

If a USB3 device only appears at 480 Mb/s:

1. Test a different known-good USB3 disk or enclosure.
2. Do not trust only one flash drive.
3. Check BIOS USB/xHCI settings.
4. Check whether macOS shows `AppleUSB30XHCIPort` or `SSP` ports:

```bash
ioreg -p IOService -w0 | grep -Ei "SSP[0-9]@|SS[0-9]@|AppleUSB30XHCIPort"
```

5. Temporarily compare behavior with and without your current USB map.
6. Make sure you are under the macOS 15-port limit per controller.
7. Build a final USB map using USBToolBox or your preferred method.
8. Validate again with:

```bash
system_profiler SPUSBDataType
ioreg -p IOService -w0 | grep -Ei "HS0[1-9]@|HS1[0-9]@|SSP[0-9]@|SS[0-9]@"
```

## Final validation

After applying your final map:

```bash
kmutil showloaded | grep -Ei "USBToolBox|UTB|XHCI"
ioreg -p IOService -w0 | grep -Ei "HS0[1-9]@|HS1[0-9]@|SSP[0-9]@|SS[0-9]@"
system_profiler SPUSBDataType
```

Then physically test:

- USB2 device in every physical port.
- USB3 disk in every USB3-capable port.
- Internal Bluetooth.
- Internal webcam.
- Card reader, if USB-based.
