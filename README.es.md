# Guía para armar/reinstalar Hackintosh con OpenCore

[English](README.md)

Guía práctica y completa para quienes quieren intentar instalar macOS en hardware no Apple usando OpenCore.

La idea del repo es convertir días de investigación, pruebas, mapeo USB, reconstrucción de EFI y validaciones post-instalación en un proceso claro, ordenado y repetible.

## Qué es este repo

Este repo es un **workflow guiado**, no una EFI universal.

Incluye:

- Flujo completo de instalación desde cero.
- Qué descargar.
- Qué correr.
- Qué cosas se deciden sí o sí por máquina.
- Scripts para relevar hardware, probar USB y validar post-instalación.
- Plantillas para documentar tu propia computadora.
- Un caso real sanitizado basado en una HP Envy 17t-j000.

## Qué no es este repo

Este repo **no** incluye:

- Instaladores de macOS.
- Una EFI universal.
- EFIs privadas.
- Valores privados de SMBIOS.
- Credenciales de Apple.
- La app de OpenCore Legacy Patcher.
- La app de HeliPort.
- El binario/app de OpenCore Simplify.

Esas herramientas se descargan aparte desde sus proyectos oficiales o fuentes legítimas.

## Empezá acá

Leé la guía completa en orden:

1. [Descargas necesarias](docs/es/01-descargas-necesarias.md)
2. [Relevamiento de hardware](docs/es/02-relevamiento-hardware.md)
3. [Crear el instalador de macOS](docs/es/03-crear-instalador.md)
4. [Crear la primera EFI con OpenCore Simplify](docs/es/04-opencore-simplify.md)
5. [Bootear e instalar macOS](docs/es/05-instalar-macos.md)
6. [Copiar OpenCore al disco interno](docs/es/06-instalar-opencore-interno.md)
7. [Post-instalación: OCLP, Wi-Fi, audio, pantalla](docs/es/07-post-instalacion.md)
8. [USB mapping](docs/es/08-usb-mapping.md)
9. [Checklist de validación](docs/es/09-validacion.md)
10. [Solución de problemas](docs/es/10-troubleshooting.md)
11. [Referencia de scripts](docs/es/11-referencia-scripts.md)

## Flujo rápido de comandos

Cuando macOS ya booteó, copiá o cloná este repo y corré:

```bash
./scripts/00-collect-hardware.sh
```

Después de la primera post-instalación, corré:

```bash
./scripts/01-verify-post-install.sh
```

Para mapear USB, usá:

```bash
./scripts/usb-watch-simple.sh
./scripts/usb-ssp-test.sh
```

## Notas importantes de seguridad

Nunca publiques ni reutilices valores SMBIOS de otra persona.

No subas a GitHub:

- `SystemSerialNumber`
- `MLB`
- `SystemUUID`
- `ROM`
- `config.plist` privado
- carpeta EFI privada

Usá:

```text
templates/machine-notes-template.md
```

para documentar tu propia máquina sin filtrar datos privados.

## Caso real

Ver:

```text
case-studies/hp-envy-17t-j000/README.md
```

Ese caso está sanitizado. Explica qué funcionó en esa máquina sin compartir identificadores privados.
