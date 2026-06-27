# 03 - Crear el instalador de macOS

Creá un USB instalador de macOS usando una fuente legítima de Apple.

## Pasos generales

1. Descargar el instalador de macOS.
2. Preparar un pendrive.
3. Crear el instalador.
4. Montar la partición EFI del pendrive.
5. Copiar tu EFI generada a la partición EFI del pendrive.

## Importante

El pendrive instalador tiene dos cosas separadas:

1. El volumen instalador de macOS.
2. La partición EFI con OpenCore.

Necesitás ambas.

## Tiempo de instalación

macOS puede mostrar estimaciones muy exageradas, a veces de varias horas.

En la práctica, la primera etapa puede tardar bastante menos que lo indicado, pero el instalador puede reiniciar varias veces.

No lo interrumpas solo porque la estimación de tiempo parezca absurda.
