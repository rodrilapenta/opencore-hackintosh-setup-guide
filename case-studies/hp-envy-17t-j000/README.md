# Case Study: HP Envy 17t-j000

Sanitized case study for one successful HP Envy 17t-j000 Hackintosh setup.

## Hardware notes

- CPU generation: Haswell
- iGPU: Intel HD 4600
- dGPU: NVIDIA GT 750M, not used by macOS
- Wi-Fi: Intel AC 3160
- Ethernet: Realtek RTL8111
- Audio: IDT 92HD91BXX
- Optical drive: hp BD MLT UJ262 (detected but not reading discs by now)
- USB controller: Intel 8 Series XHCI

## Final known state

- macOS Sequoia 15
- SMBIOS model: MacBookPro11,5
- Intel HD 4600 accelerated with OCLP
- Audio working with `alcid=13`
- HDMI working
- USB mapping working with USBToolBox + UTBMap
- SD card reader working with RealtekCardReader/RealtekCardReaderFriend
- Webcam working
- Bluetooth visible/working
- Fingerprint reader visible as USB, not usable as Touch ID
- Optical drive detected by SATA/ATAPI, media read not confirmed

## USB map

| Physical port | HS side | SS side |
|---|---:|---:|
| USB-L-01 (closest to SD card reader) | HS01 | SSP2 |
| USB-L-02 | HS02 | SSP3 |
| USB-R-01 | HS03 | SSP4 |
| USB-R-02 | HS04 | SSP5 |

Internal:

| Device | Port |
|---|---:|
| Bluetooth | HS05 |
| Webcam | HS07 |
| Fingerprint reader | HS14 |
