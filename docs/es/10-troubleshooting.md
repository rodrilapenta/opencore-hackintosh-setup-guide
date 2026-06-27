# 10 - Solución de problemas

## USB3 aparece solo a 480 Mb/s

1. Usar un disco USB3 conocido.
2. Revisar opciones xHCI/USB3 en BIOS.
3. Comparar con y sin USBToolBox/mapa USB.
4. Revisar si existen `AppleUSB30XHCIPort` o puertos `SSP`.
5. Reconstruir el mapa debajo del límite de 15 puertos.

## No hay aceleración gráfica

Revisar:

- SMBIOS.
- WhateverGreen.
- boot-args.
- root patches de OCLP.
- Estado de dGPU no soportada.

## No hay Wi-Fi

Revisar:

- `itlwm` + HeliPort.
- `AirportItlwm`.
- Parches Wi-Fi de OCLP.
- Si el chipset Wi-Fi tiene soporte.

## Lector óptico detectado pero no lee discos

Una unidad SATA/ATAPI puede estar detectada por macOS pero no leer medios por:

- lente sucia.
- láser débil.
- mecanismo viejo.
- disco dañado.
