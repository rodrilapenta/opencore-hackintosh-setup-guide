# OpenCore Hackintosh Setup Guide

[Español](README.es.md)

A complete, practical workflow for people who want to try installing macOS on non-Apple hardware using OpenCore.

This repository is meant to turn days of trial, research, USB testing, EFI rebuilding and post-install checks into a clear step-by-step process.

## What this repo is

This is a **guided workflow**, not a universal EFI.

It gives you:

- The full installation flow from zero.
- What to download.
- What to run.
- What must be decided per machine.
- Scripts for hardware collection, USB testing and post-install validation.
- A sanitized case study based on an HP Envy 17t-j000.

## What this repo is not

This repo does **not** include:

- macOS installers.
- A universal EFI.
- Private EFIs.
- Private SMBIOS values.
- Apple credentials.
- OpenCore Legacy Patcher app bundle.
- HeliPort app bundle.
- OpCore-Simplify binary/app.

Those tools must be downloaded separately from their official projects or legitimate sources.

## Start here

Read the full guide in order:

1. [Required downloads](docs/en/01-required-downloads.md)
2. [Hardware discovery](docs/en/02-hardware-discovery.md)
3. [Create the macOS installer](docs/en/03-create-installer.md)
4. [Build the first EFI with OpCore-Simplify](docs/en/04-opencore-simplify.md)
5. [Boot and install macOS](docs/en/05-install-macos.md)
6. [Copy OpenCore to the internal disk](docs/en/06-install-opencore-internal.md)
7. [Post-install: OCLP, Wi-Fi, audio, display](docs/en/07-post-install.md)
8. [USB mapping](docs/en/08-usb-mapping.md)
9. [Validation checklist](docs/en/09-validation.md)
10. [Troubleshooting](docs/en/10-troubleshooting.md)
11. [Scripts reference](docs/en/11-scripts-reference.md)

## Quick command flow

After macOS boots, clone or copy this repo and run:

```bash
./scripts/00-collect-hardware.sh
```

After your first post-install setup, run:

```bash
./scripts/01-verify-post-install.sh
```

For USB mapping, use:

```bash
./scripts/usb-watch-simple.sh
./scripts/usb-ssp-test.sh
```

## Important safety notes

Never publish or reuse someone else's SMBIOS values.

Do not commit:

- `SystemSerialNumber`
- `MLB`
- `SystemUUID`
- `ROM`
- private `config.plist`
- private EFI folders


## Case study

See:

```text
case-studies/hp-envy-17t-j000/README.md
```

This case study is sanitized. It explains what worked on that machine without sharing private identifiers.

- [Power management and sleep](docs/en/12-power-management.md)
