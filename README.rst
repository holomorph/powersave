powersave
=========

A fork from vodik_'s powersave_.  My configuration for maximizing the battery
life on my Vaio VPCSA4.

Included here are various configs that set or control certain power saving
features. As much as possible is set statically on boot; it's silly to have
needless power consumption. This is integrated with vodik's backlight-util
package lightd_.

modprobe.d/powersave.conf
-------------------------

Set the following kernel module options:

- ``kbd_backlight=0`` for ``sony_laptop``
- ``autosuspend=1`` for ``usbcore``
- ``power_save=1`` and ``power_save_controller=Y`` for ``snd_hda_intel``

sysctl.d/powersave.conf
-----------------------

- disable NMI watchdog
- set laptop mode
- increase the dirty expire/writeback time

rules.d/50-*-powersave.rules
----------------------------

- ``backlight``: Set brightness depending on AC power.

- ``network``: Set the powersaving features that must be enabled by 3rd-party
  commands:

::

  ethtool -s enp2s0 wol d
  iw dev wlp2s0 set power_save on

- ``pci`` & ``usb``: Set power management attributes ``power/control="auto"``
  for PCI and USB devices.

- ``sata``: Enable SCSI/SATA link powersaving features

- ``sony``: Set fan control profile ``silent`` for ``sony-laptop``.

- Disable radeon whistler:

::

  KERNEL=="card1", SUBSYSTEM=="drm", RUN+="/usr/bin/radeon"

radeon
------

::

  #!/bin/sh
  echo OFF > /sys/kernel/debug/vgaswitcheroo/switch

.. Links
.. _vodik: https://github.com/vodik
.. _powersave: https://github.com/vodik/powersave
.. _lightd: https://github.com/vodik/lightd
