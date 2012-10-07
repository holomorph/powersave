## powersave

My configuration for maximizing the battery life on my Vaio VPCSA4. A fork
from [vodik](https://github.com/vodik)'s
[powersave](https://github.com/vodik/powersave)

Included here are various config-lets that set or
control certain power saving features. As much as possible is set
statically on boot; it's silly to have needless power
consumption. This is integrated with vodik's
[backlight utilities][backlight].

### modprobe.d/{modprobe.conf,powersave.conf}

Set `autosuspend=1` for `usbcore`, and enable `power_save=1` and `power_save_controller=Y` for `snd_hda_intel`.

### sysctl.d/powersave.conf

- disable NMI watchdog
- set laptop mode
- adjust the dirty ratio
- increase the dirty expire/writeback time

### tmpfiles.d/powersave.conf

Disable Radeon whistler, keyboard backlight. Enable pci, usb, and sata powersaving features:

```
w /sys/kernel/debug/vgaswitcheroo/switch - - - - OFF
w /sys/devices/platform/sony-laptop/kbd_backlight - - - - 0
w /sys/devices/*/power/control - - - - auto
w /sys/devices/system/cpu/sched_mc_power_savings - - - - 1
w /sys/bus/*/devices/*/power/control - - - - auto
w /sys/bus/usb/devices/*/power/level - - - - auto
w /sys/class/scsi_host/host?/link_power_management_policy - - - - min_power
```

### rules.d/50-network-powersave.rules
Set the powersaving features that must be enabled by 3rd-party commands:

```
ethtool -s eth0 wol d
iw dev wlan0 set power_save on
```

[backlight]: https://github.com/vodik/backlight-utils
