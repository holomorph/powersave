pkgname=powersave-hm-git
pkgver=62.4c72acc
pkgrel=1
pkgdesc="Powersaving settings, holomorph fork"
arch=('any')
url="http://github.com/holomorph/powersave"
license=('GPL')
depends=('systemd')
makedepends=('git')
source=('git://github.com/holomorph/powersave.git')
md5sums=('SKIP')

pkgver() {
  cd "powersave"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "powersave"
  install -Dm644 sysctl.d/powersave.conf "$pkgdir/usr/lib/sysctl.d/powersave.conf"
  install -Dm644 modprobe.d/powersave.conf "$pkgdir/usr/lib/modprobe.d/powersave.conf"
  install -Dm644 rules.d/50-backlight-powersave.rules "$pkgdir/usr/lib/udev/rules.d/50-backlight-powersave.rules"
  install -Dm644 rules.d/50-network-powersave.rules "$pkgdir/usr/lib/udev/rules.d/50-network-powersave.rules"
  install -Dm644 rules.d/50-pci-powersave.rules "$pkgdir/usr/lib/udev/rules.d/50-pci-powersave.rules"
  install -Dm644 rules.d/50-radeon.rules "$pkgdir/usr/lib/udev/rules.d/50-radeon.rules"
  install -Dm644 rules.d/50-sata-powersave.rules "$pkgdir/usr/lib/udev/rules.d/50-sata-powersave.rules"
  install -Dm644 rules.d/50-sony-powersave.rules "$pkgdir/usr/lib/udev/rules.d/50-sony-powersave.rules"
  install -Dm644 rules.d/50-usb-powersave.rules "$pkgdir/usr/lib/udev/rules.d/50-usb-powersave.rules"
  install -Dm755 radeon "$pkgdir/usr/bin/radeon"
}

# vim: ft=sh syn=sh et
