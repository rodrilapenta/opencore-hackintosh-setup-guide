# 11 - Referencia de scripts

Este repo incluye scripts de ayuda. **No** instalan macOS y **no** generan una EFI universal.

Sirven para:

- relevar hardware
- validar post-instalación
- detectar puertos USB
- probar USB SuperSpeed

## Política de idioma

Los scripts quedan solo en inglés.

Motivo:

- mantenimiento más simple
- issues más fáciles de reportar
- logs más fáciles de copiar/pegar
- nombres más alineados con herramientas upstream y salidas de macOS

La documentación está en inglés y español. Los scripts usan prompts y salida en inglés.

## `scripts/00-collect-hardware.sh`

Recolecta información de hardware cuando macOS ya bootea.

### Cuándo correrlo

Corré este script después de tener un macOS booteable.

### Uso

```bash
./scripts/00-collect-hardware.sh
```

### Salida

Crea una carpeta en el Escritorio:

```text
~/Desktop/hackintosh-hardware-report-YYYYMMDD-HHMMSS/
```

Puede contener reportes como:

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

### Advertencia de privacidad

La salida puede incluir información específica de la máquina.

No publiques el reporte generado sin revisarlo.

## `scripts/01-verify-post-install.sh`

Hace una validación general post-instalación.

### Cuándo correrlo

Corré este script después de bootear macOS y después de instalar o ajustar tu EFI.

### Uso

```bash
./scripts/01-verify-post-install.sh
```

### Qué revisa

- kexts cargados
- puertos USB visibles por IORegistry
- interfaces de red
- información de pantalla
- información de audio
- árbol USB
- Bluetooth
- almacenamiento/SATA

### Notas

Este script no arregla nada. Solo imprime información de diagnóstico.

## `scripts/usb-watch-simple.sh`

Ayuda a detectar qué cambia al conectar un dispositivo USB.

### Cuándo correrlo

Usalo durante el USB mapping.

### Uso

```bash
./scripts/usb-watch-simple.sh
```

### Flujo típico

1. Corré el script.
2. Seguí las instrucciones.
3. Conectá un solo dispositivo USB.
4. Presioná Enter cuando lo pida.
5. Desconectalo.
6. Repetí con cada puerto físico.

### Objetivo

Ayuda a identificar qué puerto lógico HS corresponde a cada puerto físico.

## `scripts/usb-ssp-test.sh`

Guía la prueba de USB3/SuperSpeed puerto por puerto.

### Cuándo correrlo

Usalo durante el USB mapping, con un dispositivo USB3 conocido y confiable.

### Uso

```bash
./scripts/usb-ssp-test.sh
```

### Flujo típico

1. Usá un disco USB3 conocido.
2. Conectalo al puerto físico indicado.
3. Presioná Enter.
4. Dejá que el script tome el resultado.
5. Expulsá/desconectá de forma segura cuando corresponda.
6. Seguí con el próximo puerto.

### Objetivo

Ayuda a identificar puertos SS/SSP y si un dispositivo negocia a:

```text
Speed: Up to 5 Gb/s
```

o cae a:

```text
Speed: Up to 480 Mb/s
```

### Importante

No confíes en un solo pendrive USB3 dudoso. Algunos pendrives USB3 negocian como USB2 en ciertas máquinas. Es mejor usar un disco externo USB3 conocido o un buen enclosure.

## `scripts/usb-watch-map.py`

Watcher/helper experimental para USB.

### Cuándo correrlo

Usalo solo si entendés el script y querés una ayuda más automatizada para detección USB.

### Uso

```bash
python3 scripts/usb-watch-map.py
```

### Notas

Este script es opcional. Los helpers recomendados para USB mapping son:

```bash
./scripts/usb-watch-simple.sh
./scripts/usb-ssp-test.sh
```

## Orden sugerido

Para la mayoría de los usuarios:

```bash
./scripts/00-collect-hardware.sh
./scripts/01-verify-post-install.sh
./scripts/usb-watch-simple.sh
./scripts/usb-ssp-test.sh
```

Los scripts USB solo son útiles durante el mapeo USB.
