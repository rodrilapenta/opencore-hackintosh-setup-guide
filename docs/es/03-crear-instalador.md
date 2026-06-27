# 03 - Crear el USB instalador de macOS

Este workflow usa un pendrive estilo instalador online/recovery con OpenCore.

El USB contiene:

```text
EFI/
com.apple.recovery.boot/
```

`EFI/` sale de la EFI generada con OpenCore.

`com.apple.recovery.boot/` contiene los archivos Recovery/BaseSystem de Apple descargados con `macrecovery`, que viene dentro de OpenCorePkg.

## 1. Descargar OpenCorePkg

Descargá OpenCorePkg desde:

```text
https://github.com/acidanthera/OpenCorePkg
```

Necesitás la carpeta:

```text
Utilities/macrecovery/
```

## 2. Elegir la versión de macOS

Abrí:

```text
Utilities/macrecovery/recovery_urls.txt
```

o revisalo online:

```text
https://github.com/acidanthera/OpenCorePkg/blob/master/Utilities/macrecovery/recovery_urls.txt
```

Elegí la entrada/versión que querés instalar.

La mejor versión de macOS depende de tu hardware. Hardware viejo puede requerir OpenCore Legacy Patcher, y algunas combinaciones directamente no convienen.

## 3. Descargar Recovery/BaseSystem con macrecovery

Desde la carpeta `Utilities/macrecovery/`, corré el comando para la versión de macOS elegida.

Los argumentos exactos dependen de la entrada en `recovery_urls.txt`.

Un flujo típico de macrecovery se ve así:

```bash
python3 macrecovery.py -b <BOARD_ID> -m <MLB_OR_PRODUCT_ID> download
```

Esto debería descargar archivos como:

```text
BaseSystem.dmg
BaseSystem.chunklist
```

Creá una carpeta llamada:

```text
com.apple.recovery.boot
```

y poné ahí los archivos BaseSystem descargados si la herramienta no creó ya esa estructura.

## 4. Preparar el pendrive

Usá Rufus, Utilidad de Discos, `diskpart`, `diskutil` u otra herramienta.

Layout recomendado:

```text
Esquema de particiones: GPT
Sistema de archivos: FAT32
```

La raíz del USB debería terminar con:

```text
EFI/
com.apple.recovery.boot/
```

## 5. Crear la EFI con OpCore-Simplify

Usá OpCore-Simplify desde:

```text
https://github.com/lzhoang2801/OpCore-Simplify
```

Ejecutá el flujo de detección/build y generá tu primera EFI.

La EFI generada es una base inicial. No está garantizado que sea la EFI final.

## 6. Copiar archivos al USB

Copiá la carpeta EFI generada a la raíz del USB:

```text
EFI/
```

Copiá la carpeta recovery a la raíz del USB:

```text
com.apple.recovery.boot/
```

Raíz esperada del USB:

```text
USB_ROOT/
  EFI/
    BOOT/
    OC/
  com.apple.recovery.boot/
    BaseSystem.dmg
    BaseSystem.chunklist
```

## 7. Bootear desde el USB

Booteá la computadora destino desde el pendrive.

Elegí OpenCore y después la entrada del instalador macOS Recovery/BaseSystem.

## Notas

El instalador puede mostrar tiempos muy inexactos. Puede decir que tarda horas, pero la primera etapa real puede ser bastante más corta.

No interrumpas la instalación solo porque la estimación parezca absurda. Puede reiniciar varias veces.
