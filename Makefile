PREFIX = /usr
BINDIR = $(PREFIX)/bin
LIBDIR = $(PREFIX)/lib

all:

install:
	install -Dm755 radeon $(DESTDIR)$(BINDIR)/radeon
	install -d $(DESTDIR)$(LIBDIR)/modprobe.d
	install -d $(DESTDIR)$(LIBDIR)/udev/rules.d
	install -d $(DESTDIR)$(LIBDIR)/sysctl.d
	install -m644 modprobe.d/powersave.conf $(DESTDIR)$(LIBDIR)/modprobe.d
	install -m644 rules.d/50-backlight-powersave.rules $(DESTDIR)$(LIBDIR)/udev/rules.d
	install -m644 rules.d/50-network-powersave.rules $(DESTDIR)$(LIBDIR)/udev/rules.d
	install -m644 rules.d/50-pci-powersave.rules $(DESTDIR)$(LIBDIR)/udev/rules.d
	install -m644 rules.d/50-radeon.rules $(DESTDIR)$(LIBDIR)/udev/rules.d
	install -m644 rules.d/50-sata-powersave.rules $(DESTDIR)$(LIBDIR)/udev/rules.d
	install -m644 rules.d/50-sony-powersave.rules $(DESTDIR)$(LIBDIR)/udev/rules.d
	install -m644 rules.d/50-usb-powersave.rules $(DESTDIR)$(LIBDIR)/udev/rules.d
	install -m644 sysctl.d/powersave.conf $(DESTDIR)$(LIBDIR)/sysctl.d

.PHONY: all install
