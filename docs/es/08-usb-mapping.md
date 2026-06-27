# 08 - USB mapping

El mapeo USB es clave para un Hackintosh estable.

## Qué entender

Un puerto físico USB 3.x Type-A normalmente tiene dos lados lógicos:

- **HS**: lado USB2.
- **SS/SSP**: lado USB3 SuperSpeed.

También puede haber dispositivos internos usando USB:

- Bluetooth.
- Webcam.
- Lector de huellas.
- Pantalla táctil.
- Lector de tarjetas interno.

## Qué puede hacer este repo de forma genérica

Este repo puede ayudarte a descubrir y documentar puertos.

No puede generar un mapa USB universal perfecto porque el mapa final es específico de cada máquina.

## Scripts incluidos

### Descubrimiento HS / USB2

Usá:

```bash
./scripts/usb-watch-simple.sh
```

Dispositivo recomendado:

- Dongle de mouse USB2.
- Pendrive USB2 simple.
- Cualquier dispositivo USB2 confiable.

Qué hace:

1. Toma un baseline del árbol USB.
2. Te pide conectar un dispositivo a un puerto físico.
3. Captura el nuevo árbol USB.
4. Muestra la diferencia.
5. Guarda un log en el Escritorio.

Usalo para mapear el lado HS de los puertos físicos.

### Descubrimiento SS / USB3 SuperSpeed

Usá:

```bash
./scripts/usb-ssp-test.sh
```

Dispositivo recomendado:

- Disco externo USB3 conocido.
- Enclosure USB3 conocido.

No conviene depender de un pendrive USB3 random. Algunos pendrives USB3 negocian como USB2 en ciertas máquinas.

Qué hace:

1. Te pide una etiqueta para el puerto físico.
2. Te pide conectar el dispositivo USB3.
3. Captura velocidad, Location ID, info del disco y puertos IORegistry.
4. Guarda un log en el Escritorio.

Usalo para identificar qué puertos físicos negocian a:

```text
Speed: Up to 5 Gb/s
```

o superior.

Si un puerto solo muestra:

```text
Speed: Up to 480 Mb/s
```

entonces el dispositivo está entrando por USB2/HS, no por USB3.

## Etiquetas físicas sugeridas

Usá etiquetas que tengan sentido para tu máquina:

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

## Qué hacer si USB3 no se detecta bien

Si un dispositivo USB3 aparece solo a 480 Mb/s:

1. Probá con otro disco/enclosure USB3 conocido.
2. No confíes en un solo pendrive.
3. Revisá opciones USB/xHCI en BIOS.
4. Revisá si macOS muestra `AppleUSB30XHCIPort` o puertos `SSP`:

```bash
ioreg -p IOService -w0 | grep -Ei "SSP[0-9]@|SS[0-9]@|AppleUSB30XHCIPort"
```

5. Compará temporalmente con y sin tu mapa USB actual.
6. Verificá que estés debajo del límite de 15 puertos por controladora.
7. Creá un mapa final con USBToolBox o el método que prefieras.
8. Validá otra vez con:

```bash
system_profiler SPUSBDataType
ioreg -p IOService -w0 | grep -Ei "HS0[1-9]@|HS1[0-9]@|SSP[0-9]@|SS[0-9]@"
```

## Validación final

Después de aplicar el mapa final:

```bash
kmutil showloaded | grep -Ei "USBToolBox|UTB|XHCI"
ioreg -p IOService -w0 | grep -Ei "HS0[1-9]@|HS1[0-9]@|SSP[0-9]@|SS[0-9]@"
system_profiler SPUSBDataType
```

Después probá físicamente:

- Dispositivo USB2 en cada puerto físico.
- Disco USB3 en cada puerto USB3.
- Bluetooth interno.
- Webcam interna.
- Lector de tarjetas, si usa USB.
