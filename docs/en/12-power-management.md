# 12 - Power management and sleep

Sleep/wake behavior is machine-specific on Hackintosh systems.

Do not assume that a working boot, working graphics acceleration, and working USB mapping automatically mean that sleep is safe.

## Recommended validation order

Test in this order:

1. Display sleep.
2. Manual system sleep.
3. Automatic idle system sleep.

### 1. Display sleep

```bash
sudo pmset -a displaysleep 1
sudo pmset -a sleep 0
```

Leave the machine idle until the display turns off, then wake it with keyboard, trackpad, mouse, or power button.

If it wakes correctly, display sleep is probably safe.

### 2. Manual system sleep

```bash
sudo pmset sleepnow
```

Wake the machine after a few seconds.

If it wakes correctly, basic sleep/wake is probably working.

### 3. Automatic idle system sleep

```bash
sudo pmset -a displaysleep 1
sudo pmset -a disksleep 1
sudo pmset -a sleep 2
```

Leave the machine untouched for at least 3 minutes.

If it black-screens, freezes, or fails to wake, automatic idle system sleep is not safe on that machine.

## Conservative safe settings

If automatic idle system sleep fails but display sleep works, use:

```bash
./scripts/set-safe-power-settings.sh
```

This allows the display to turn off but prevents automatic full system sleep.

## What to check when sleep fails

Collect logs:

```bash
pmset -g assertions
pmset -g log | grep -Ei "Entering Sleep|Wake from|DarkWake|Sleep|Wake|Failure|timeout|hibernate|display|IODisplayWrangler|SleepService|Previous Sleep Cause|Wake reason" | tail -250
```

Common suspects:

- `WindowServer` timeouts.
- `AppleIntelFramebuffer` wake delays.
- USB wake sources.
- Bluetooth sleep delays.
- Wi-Fi / `wifip2pd` timeouts.
- HDMI or external display state.
- Handoff / sharingd assertions.
- OCLP legacy graphics patches.
- ACPI issues.

## Isolation tests

If automatic idle sleep fails, retest with:

- external display disconnected
- USB dongles disconnected
- Wi-Fi disabled
- Bluetooth disabled
- Handoff disabled
- only internal keyboard/trackpad/power button used for wake
