## powersave

My configuration for maximizing the battery life on my Vaio VPCSA4. A fork
from [vodik](https://github.com/vodik)'s
[powersave](https://github.com/vodik/powersave)

Included here is a systemd service file and various config-lets that set or
control certain power saving features. I set as much
as I can statically on boot; I think it's silly to increase power
consumption simply because I'm on AC power. This is integrated with vodik's
[backlight utilities][backlight].

### powersave.service

Set the powersaving features that must be enabled by 3rd-party commands:

```
ethtool -s eth0 wol d
iw dev wlan0 set power_save on
```

### modprobe.d/powersave.conf

Enable `power_save=1` and `power_save_controller=Y` for `snd_hda_intel`

### sysctl.d/powersave.conf

- disable NMI watchdog
- set laptop mode
- adjust the dirty ratio
- increase the dirty expire/writeback time

### tmpfiles.d/powersave.conf

Disable Radeon whistler, keyboard backlight. Enable pci, usb, and sata powersaving features:

```
w /sys/kernel/debug/vgaswitcheroo/switch - - - - OFF
w /sys/class/backlight/acpi_video*/brightness - - - - 0
w /sys/devices/platform/sony-laptop/kbd_backlight - - - - 0
w /sys/devices/*/power/control - - - - auto
w /sys/devices/system/cpu/sched_mc_power_savings - - - - 1
w /sys/bus/*/devices/*/power/control - - - - auto
w /sys/bus/usb/devices/*/power/autosuspend - - - - 1
w /sys/bus/usb/devices/*/power/level - - - - auto
w /sys/class/scsi_host/host?/link_power_management_policy - - - - min_power
```

### rules.d/50-powersave.rules

Depending if we are on AC or battery power:

- sets the backlight to either 5% or max
- start or stop the [dimmer.service][backlight]

  [backlight]: https://github.com/vodik/backlight-utils
