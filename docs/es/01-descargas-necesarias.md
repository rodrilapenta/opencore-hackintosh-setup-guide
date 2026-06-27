# 01 - Descargas necesarias

Este repo no incluye herramientas de terceros ni macOS.

Tenés que descargar lo necesario por separado.

## Necesario

### OpenCore

OpenCore es el bootloader. Lo vas a usar directamente o a través de herramientas que generan una EFI basada en OpenCore.

### OpenCore Simplify

En este workflow se usa para generar la primera EFI a partir del hardware detectado.

Tomalo como una base inicial. Después hay que validar y ajustar.

### Instalador de macOS

Usá una fuente legítima de Apple para obtener macOS.

La versión correcta depende de tu hardware.

Guía general:

- Hardware más nuevo: usar una versión de macOS soportada actualmente.
- Hardware Intel viejo: revisar soporte de OpenCore Legacy Patcher antes de elegir.
- GPUs/Wi-Fi muy viejos: probablemente necesites OCLP o cambiar hardware.

No uses imágenes random modificadas de macOS.

### ProperTree o editor de plist

Sirve para revisar y editar `config.plist`.

### OpenCore Legacy Patcher

Solo hace falta si tu hardware necesita parches legacy.

Casos comunes:

- Aceleración de iGPU Intel vieja.
- Wi-Fi no soportado.
- macOS nuevo en hardware viejo.

### HeliPort

Hace falta cuando usás `itlwm.kext` para Wi-Fi Intel.

Si usás `AirportItlwm.kext`, puede que no haga falta.

### USBToolBox

Sirve para crear el mapa USB final.

Este repo incluye scripts para descubrir y validar puertos, pero el mapa final es específico de cada máquina.

## No incluido a propósito

Este repo no incluye:

- macOS.
- EFIs.
- valores SMBIOS.
- app de OCLP.
- app de HeliPort.
- binario/app de OpenCore Simplify.
