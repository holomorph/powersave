PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
LIBDIR = $(PREFIX)/lib

RULES = rules.d/50-backlight-powersave.rules \
        rules.d/50-network-powersave.rules \
        rules.d/50-pci-powersave.rules \
        rules.d/50-radeon.rules \
        rules.d/50-sata-powersave.rules \
        rules.d/50-sony-powersave.rules \
        rules.d/50-usb-powersave.rules

all:

install:
	install -Dm755 radeon $(DESTDIR)$(BINDIR)/radeon
	install -d $(DESTDIR)$(LIBDIR)/modprobe.d
	install -d $(DESTDIR)$(LIBDIR)/udev/rules.d
	install -d $(DESTDIR)$(LIBDIR)/sysctl.d
	install -m644 modprobe.d/powersave.conf $(DESTDIR)$(LIBDIR)/modprobe.d
	install -m644 $(RULES) $(DESTDIR)$(LIBDIR)/udev/rules.d
	install -m644 sysctl.d/powersave.conf $(DESTDIR)$(LIBDIR)/sysctl.d

.PHONY: all install
