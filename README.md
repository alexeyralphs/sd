## Install:
```bash
sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/alexeyralphs/sd/refs/heads/main/install.sh)"
```
Clip skip:
```bash
2
```
Clip skip SDXL: Enable

Windows Regedit: \HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers
DWORD 32bit: TdrLevel -> Hex 0
DWORD 32bit: TdrDelay -> Hex 20
