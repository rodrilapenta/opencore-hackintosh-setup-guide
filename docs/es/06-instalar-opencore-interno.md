# 06 - Copiar OpenCore al disco interno

Después de bootear macOS usando el OpenCore del pendrive, instalá OpenCore en el disco interno.

## Pasos

1. Montar la partición EFI del disco interno.
2. Hacer backup de cualquier EFI existente.
3. Copiar la EFI funcional a la partición EFI interna.
4. Reiniciar.
5. Elegir el OpenCore del disco interno.
6. Hacer Reset NVRAM una vez después de cambios grandes de EFI.
7. Bootear macOS desde el disco interno.

## Por qué

Sin este paso, el sistema depende del pendrive para arrancar.
