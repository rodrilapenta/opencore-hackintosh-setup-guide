# 12 - Gestión de energía y suspensión

El comportamiento de sleep/wake es específico de cada Hackintosh.

No hay que asumir que, porque bootea, tiene aceleración gráfica y USB mapping, la suspensión ya es segura.

## Orden recomendado de validación

Probar en este orden:

1. Apagado de pantalla.
2. Suspensión manual.
3. Suspensión automática por inactividad.

### 1. Apagado de pantalla

```bash
sudo pmset -a displaysleep 1
sudo pmset -a sleep 0
```

Dejá la máquina quieta hasta que se apague la pantalla y despertala con teclado, trackpad, mouse o botón power.

Si vuelve bien, el apagado de pantalla probablemente es seguro.

### 2. Suspensión manual

```bash
sudo pmset sleepnow
```

Despertala después de unos segundos.

Si vuelve bien, el sleep/wake básico probablemente funciona.

### 3. Suspensión automática por inactividad

```bash
sudo pmset -a displaysleep 1
sudo pmset -a disksleep 1
sudo pmset -a sleep 2
```

Dejá la máquina sin tocar por al menos 3 minutos.

Si queda negra, se congela o no vuelve, la suspensión automática por inactividad no es segura en esa máquina.

## Configuración conservadora segura

Si falla el sleep automático pero funciona el apagado de pantalla, usá:

```bash
./scripts/set-safe-power-settings.sh
```

La pantalla se puede apagar, pero el sistema no entra en suspensión completa automáticamente.

## Qué revisar cuando falla sleep

Recolectar logs:

```bash
pmset -g assertions
pmset -g log | grep -Ei "Entering Sleep|Wake from|DarkWake|Sleep|Wake|Failure|timeout|hibernate|display|IODisplayWrangler|SleepService|Previous Sleep Cause|Wake reason" | tail -250
```

Sospechosos comunes:

- timeouts de `WindowServer`
- demoras de `AppleIntelFramebuffer`
- fuentes de wake USB
- demoras de Bluetooth
- Wi-Fi / timeouts de `wifip2pd`
- HDMI o estado de pantalla externa
- assertions de Handoff / sharingd
- parches legacy de OCLP
- problemas ACPI

## Pruebas de aislamiento

Si falla la suspensión automática, reprobar con:

- pantalla externa desconectada
- dongles USB desconectados
- Wi-Fi desactivado
- Bluetooth desactivado
- Handoff desactivado
- solo teclado/trackpad/botón power interno para despertar
