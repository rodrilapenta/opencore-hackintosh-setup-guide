# 04 - Build the first EFI with OpenCore Simplify

Use OpenCore Simplify to generate the initial EFI.

## Steps

1. Run hardware detection.
2. Select target macOS.
3. Select the closest SMBIOS.
4. Select required kexts.
5. Build EFI.
6. Copy EFI to the installer USB EFI partition.
7. Boot from OpenCore.

## This is not the final EFI

After macOS boots, you still need to:

- Validate kexts.
- Validate ACPI.
- Validate boot-args.
- Validate SMBIOS.
- Map USB.
- Apply OCLP if needed.
- Validate all devices.
