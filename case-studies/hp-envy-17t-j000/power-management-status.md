# HP Envy 17t-j000 - Power management status

Current known behavior on this machine:

```text
Display sleep: OK
Manual system sleep with pmset sleepnow: OK
Automatic idle system sleep: FAILS / black screen on wake
```

Current stable workaround:

```bash
sudo pmset -c displaysleep 10
sudo pmset -c sleep 0
sudo pmset -c disksleep 10

sudo pmset -b displaysleep 5
sudo pmset -b sleep 0
sudo pmset -b disksleep 10

sudo pmset -a hibernatemode 0
sudo pmset -a standby 0
sudo pmset -a autopoweroff 0
sudo pmset -a powernap 0
sudo pmset -a tcpkeepalive 0
sudo pmset -a proximitywake 0
sudo pmset -a womp 0
```

Observed sleep logs included:

```text
Entering Sleep state due to 'Idle Sleep'
WindowServer timed out
wifip2pd timed out
AppleIntelFramebuffer driver is slow
AppleMEClientController driver is slow
```

`darkwake=0` was tested and did not fix automatic idle sleep.

The displayplacer loginwindow fix should only target the internal screen and must not hardcode an HDMI/external display.
