# 04 - Build the first EFI with OpCore-Simplify

Use OpCore-Simplify to generate the initial EFI.

Official repository:

```text
https://github.com/lzhoang2801/OpCore-Simplify
```

## Steps

1. Download OpCore-Simplify.
2. Run the hardware detection flow.
3. Select the target macOS version.
4. Select the closest SMBIOS suggested for your hardware.
5. Select required kexts.
6. Build the EFI.
7. Review the generated EFI folder.
8. Copy it to the installer USB as:

```text
EFI/
```

Expected structure:

```text
EFI/
  BOOT/
  OC/
```

## This is not the final EFI

After macOS boots, you still need to:

- Validate kexts.
- Validate ACPI.
- Validate boot-args.
- Validate SMBIOS.
- Map USB.
- Apply OCLP if needed.
- Validate all devices.
- Copy OpenCore to the internal disk.
