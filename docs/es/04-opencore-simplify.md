# 04 - Crear la primera EFI con OpenCore Simplify

Usá OpenCore Simplify para generar la EFI inicial.

## Pasos

1. Ejecutar detección de hardware.
2. Elegir la versión objetivo de macOS.
3. Elegir el SMBIOS más cercano.
4. Elegir kexts necesarios.
5. Generar la EFI.
6. Copiar la EFI a la partición EFI del pendrive instalador.
7. Bootear desde OpenCore.

## Esta no es la EFI final

Después de bootear macOS todavía tenés que:

- Validar kexts.
- Validar ACPI.
- Validar boot-args.
- Validar SMBIOS.
- Mapear USB.
- Aplicar OCLP si hace falta.
- Validar todos los dispositivos.
