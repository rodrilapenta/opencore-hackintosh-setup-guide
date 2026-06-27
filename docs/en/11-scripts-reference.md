# 11 - Scripts reference

This repo includes helper scripts. They do **not** install macOS and they do **not** generate a universal EFI.

They are intended to help with:

- hardware collection
- post-install validation
- USB discovery
- USB SuperSpeed testing

## Language policy

Scripts are kept in English only.

Reason:

- easier maintenance
- easier issue reporting
- easier copy/paste from logs
- more likely to match upstream tooling names and macOS command output

The documentation is bilingual. The scripts themselves use English prompts and output.

## `scripts/00-collect-hardware.sh`

Collects hardware information after macOS is already booting.

### When to run

Run this after you have a bootable macOS environment.

### Usage

```bash
./scripts/00-collect-hardware.sh
```

### Output

Creates a folder on the Desktop:

```text
~/Desktop/hackintosh-hardware-report-YYYYMMDD-HHMMSS/
```

The folder may contain reports such as:

- `SPHardwareDataType.txt`
- `SPDisplaysDataType.txt`
- `SPAudioDataType.txt`
- `SPUSBDataType.txt`
- `SPSerialATADataType.txt`
- `SPEthernetDataType.txt`
- `SPBluetoothDataType.txt`
- `SPCameraDataType.txt`
- `SPCardReaderDataType.txt`
- `SPPowerDataType.txt`
- `network-hardware-ports.txt`
- `ioreg-full.txt`
- `kmutil-showloaded.txt`

### Privacy warning

The output may include machine-specific information.

Do **not** publish the generated report without reviewing it.

## `scripts/01-verify-post-install.sh`

Runs a broad post-install validation.

### When to run

Run after macOS boots and after you have installed or adjusted your EFI.

### Usage

```bash
./scripts/01-verify-post-install.sh
```

### What it checks

- loaded kexts
- USB ports visible through IORegistry
- network hardware ports
- display information
- audio information
- USB device tree
- Bluetooth
- storage/SATA

### Notes

This script does not fix anything. It only prints diagnostic information.

## `scripts/usb-watch-simple.sh`

Helps detect what changed when a USB device is plugged in.

### When to run

Use during USB mapping.

### Usage

```bash
./scripts/usb-watch-simple.sh
```

### Typical workflow

1. Run the script.
2. Follow its prompts.
3. Connect one USB device.
4. Press Enter when asked.
5. Disconnect it.
6. Repeat for each physical port.

### Purpose

It helps identify which logical HS port corresponds to a physical USB port.

## `scripts/usb-ssp-test.sh`

Guides USB3/SuperSpeed testing port by port.

### When to run

Use during USB mapping, after you have a known-good USB3 storage device.

### Usage

```bash
./scripts/usb-ssp-test.sh
```

### Typical workflow

1. Use a known-good USB3 disk.
2. Connect it to the requested physical port.
3. Press Enter.
4. Let the script collect the result.
5. Eject/disconnect safely when appropriate.
6. Continue with the next port.

### Purpose

It helps identify SS/SSP ports and whether a device is negotiating at:

```text
Speed: Up to 5 Gb/s
```

or falling back to:

```text
Speed: Up to 480 Mb/s
```

### Important

Do not rely on a single questionable USB flash drive. Some USB3 flash drives negotiate as USB2 on specific machines. Prefer a known-good USB3 external disk or enclosure.

## `scripts/usb-watch-map.py`

Experimental USB watcher/helper.

### When to run

Use only if you understand the script and want a more automated USB detection helper.

### Usage

```bash
python3 scripts/usb-watch-map.py
```

### Notes

This script is optional. The main recommended USB mapping helpers are:

```bash
./scripts/usb-watch-simple.sh
./scripts/usb-ssp-test.sh
```

## Suggested order

For most users:

```bash
./scripts/00-collect-hardware.sh
./scripts/01-verify-post-install.sh
./scripts/usb-watch-simple.sh
./scripts/usb-ssp-test.sh
```

The USB scripts are only useful during USB mapping.
