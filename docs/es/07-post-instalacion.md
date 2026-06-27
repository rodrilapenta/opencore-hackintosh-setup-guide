# 07 - Post-instalación

La post-instalación depende del hardware.

## Tareas comunes

- Aplicar root patches con OpenCore Legacy Patcher si hace falta.
- Instalar HeliPort si usás `itlwm`.
- Validar audio.
- Validar aceleración gráfica.
- Validar HDMI/DisplayPort.
- Mapear USB.
- Validar Bluetooth.
- Validar reposo/despertar.
- Validar batería.
- Validar cámara/lector SD/trackpad.

## OCLP

Si hace falta:

1. Abrir OpenCore Legacy Patcher.
2. Elegir Post-Install Root Patch.
3. Aplicar parches.
4. Reiniciar.
5. Validar aceleración gráfica.

## Wi-Fi

Si usás `itlwm.kext`:

1. Instalar HeliPort.
2. Abrir HeliPort.
3. Conectarte a Wi-Fi.

Si usás `AirportItlwm.kext`, el Wi-Fi puede aparecer como AirPort nativo según compatibilidad.
