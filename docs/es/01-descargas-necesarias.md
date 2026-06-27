# 01 - Descargas necesarias

Este repo no incluye herramientas de terceros, EFIs privadas, valores SMBIOS ni macOS.

Tenés que descargar lo necesario por separado.

## Herramientas necesarias

### OpenCorePkg

Repositorio oficial:

```text
https://github.com/acidanthera/OpenCorePkg
```

Necesitás OpenCorePkg para:

- Archivos de release de OpenCore.
- Utilidades de OpenCore.
- `macrecovery`, usado para descargar archivos Recovery/BaseSystem de Apple.

Dentro de OpenCorePkg, `macrecovery` está en:

```text
Utilities/macrecovery/
```

El archivo de referencia/catálogo de recovery es:

```text
Utilities/macrecovery/recovery_urls.txt
```

Referencia online:

```text
https://github.com/acidanthera/OpenCorePkg/blob/master/Utilities/macrecovery/recovery_urls.txt
```

### OpCore-Simplify

Repositorio oficial:

```text
https://github.com/lzhoang2801/OpCore-Simplify
```

Usá OpCore-Simplify para generar la primera EFI según tu hardware.

Importante: OpCore-Simplify crea un punto de partida. Después igual tenés que validar y corregir la EFI para tu máquina exacta.

### macOS Recovery / BaseSystem

Este workflow usa `macrecovery`, que viene dentro de OpenCorePkg, para descargar los archivos Recovery/BaseSystem de Apple para una versión de macOS.

El comando exacto depende de la versión/identificador de macOS que elijas desde `recovery_urls.txt`.

La salida normalmente incluye archivos como:

```text
BaseSystem.dmg
BaseSystem.chunklist
```

Estos archivos van dentro de una carpeta del USB llamada:

```text
com.apple.recovery.boot
```

### Herramienta para preparar el USB

Necesitás una herramienta para preparar el pendrive instalador.

Ejemplos:

- Rufus en Windows.
- Utilidad de Discos en macOS.
- `diskpart` en Windows.
- `diskutil` en macOS.

Layout recomendado para este workflow:

```text
Esquema de particiones: GPT
Sistema de archivos: FAT32
```

El USB debe contener:

```text
EFI/
com.apple.recovery.boot/
```

### ProperTree u otro editor de plist

Sirve para revisar o editar `config.plist`.

Siempre hacé backups.

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
- binario/app de OpCore-Simplify.
- binarios release de OpenCorePkg.
