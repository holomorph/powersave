## powersave
A fork from [vodik](https://github.com/vodik)'s
[powersave](https://github.com/vodik/powersave).
My configuration for maximizing the battery life on my Vaio VPCSA4.

Included here are various config-lets that set or
control certain power saving features. As much as possible is set
statically on boot; it's silly to have needless power
consumption. This is integrated with vodik's
[backlight utilities][backlight].

### modprobe.d/powersave.conf

Set the following kernel module options:

- `kbd_backlight=0` for `sony_laptop`
- `autosuspend=1` for `usbcore`
- `power_save=1` and `power_save_controller=Y` for `snd_hda_intel`

### sysctl.d/powersave.conf

- disable NMI watchdog
- set laptop mode
- adjust the dirty ratio
- increase the dirty expire/writeback time

### tmpfiles.d/powersave.conf

Set thermal control, scheduler and sata powersaving features:

```
w /sys/devices/platform/sony-laptop/thermal_control - - - - silent
w /sys/devices/system/cpu/sched_mc_power_savings - - - - 1
```

### rules.d/50-{backlight,network,pci,usb,radeon,sata,sony}-powersave.rules
Set brightness and handle `dimmer.service`.

Set the powersaving features that must be enabled by 3rd-party commands:

```
ethtool -s eth0 wol d
iw dev wlan0 set power_save on
```
Set power management attributes `power/control="auto"` for `pci` and `usb` devices.

Enable SATA powersaving features
```
ACTION=="add", SUBSYSTEM=="scsi_host", ATTR{link_power_management_policy}="min_power"
```
Set fan control profile `silent` for `sony-laptop`.

Disable radeon whistler
```
KERNEL=="card1", SUBSYSTEM=="drm", RUN+="/usr/bin/radeon"
```

### radeon
```
#!/bin/sh
echo OFF > /sys/kernel/debug/vgaswitcheroo/switch
```

[backlight]: https://github.com/vodik/backlight-utils
