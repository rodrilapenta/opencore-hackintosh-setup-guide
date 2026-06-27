# 04 - Crear la primera EFI con OpCore-Simplify

Usá OpCore-Simplify para generar la EFI inicial.

Repositorio oficial:

```text
https://github.com/lzhoang2801/OpCore-Simplify
```

## Pasos

1. Descargar OpCore-Simplify.
2. Ejecutar el flujo de detección de hardware.
3. Elegir la versión objetivo de macOS.
4. Elegir el SMBIOS más cercano sugerido para tu hardware.
5. Elegir kexts necesarios.
6. Generar la EFI.
7. Revisar la carpeta EFI generada.
8. Copiarla al pendrive instalador como:

```text
EFI/
```

Estructura esperada:

```text
EFI/
  BOOT/
  OC/
```

## Esta no es la EFI final

Después de bootear macOS todavía tenés que:

- Validar kexts.
- Validar ACPI.
- Validar boot-args.
- Validar SMBIOS.
- Mapear USB.
- Aplicar OCLP si hace falta.
- Validar todos los dispositivos.
- Copiar OpenCore al disco interno.
