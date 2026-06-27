# 02 - Relevamiento de hardware

Antes de crear una EFI, identificá tu hardware.

Necesitás saber:

- Modelo y generación de CPU.
- iGPU.
- dGPU.
- Chipset Wi-Fi.
- Chipset Bluetooth.
- Chipset Ethernet.
- Codec de audio.
- Controladora de almacenamiento.
- Controladora USB.
- Tipo de teclado/trackpad.
- Cámara.
- Lector de tarjetas.
- Salidas de video.
- Opciones de BIOS.

## Si macOS ya bootea

Corré:

```bash
./scripts/00-collect-hardware.sh
```

Crea una carpeta en el Escritorio con reportes de hardware.

## Si macOS todavía no bootea

Usá herramientas de Windows o Linux:

- Administrador de dispositivos.
- HWiNFO.
- `lspci` en Linux.
- `lsusb` en Linux.
- `inxi` en Linux.

## Por qué importa

Cada componente cambia decisiones de la EFI:

- GPU afecta SMBIOS, boot-args, WhateverGreen y OCLP.
- Wi-Fi afecta `itlwm`, `AirportItlwm`, HeliPort u OCLP.
- Audio afecta layout-id de AppleALC.
- USB requiere mapa específico de la máquina.
- Trackpads pueden requerir PS2, I2C, RMI u otros kexts.
