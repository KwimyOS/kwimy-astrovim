# Maintainer: Kwimy
pkgname=kwimy-astrovim
pkgver=0.0.1
pkgrel=1
pkgdesc="AstroVim config preseeded for new users"
arch=('any')
url="https://github.com/KwimyOS"
license=('custom')
source=()
sha256sums=()

prepare() {
  rm -rf "$srcdir/kwimy-astrovim"
  mkdir -p "$srcdir/kwimy-astrovim"

  # Copy all files from startdir to srcdir/kwimy-astrovim, including hidden ones,
  # but excluding pkg, src, and the PKGBUILD itself to avoid recursion.
  find "$startdir" -maxdepth 1 \
    -not -path "$startdir" \
    -not -name "src" \
    -not -name "pkg" \
    -not -name "PKGBUILD" \
    -not -name "*.pkg.tar.*" \
    -not -name ".SRCINFO" \
    -exec cp -r {} "$srcdir/kwimy-astrovim/" \;
}

package() {
  install -d "$pkgdir/etc/skel/.config"
  install -d "$pkgdir/etc/skel/.local/share"
  install -d "$pkgdir/etc/skel/.local/state"

  if [[ -d "$srcdir/kwimy-astrovim/config" ]]; then
    cp -a "$srcdir/kwimy-astrovim/config" \
      "$pkgdir/etc/skel/.config/nvim"
  fi

  if [[ -d "$srcdir/kwimy-astrovim/skel/.local/share/nvim" ]]; then
    cp -a "$srcdir/kwimy-astrovim/skel/.local/share/nvim" \
      "$pkgdir/etc/skel/.local/share/"
  fi

  if [[ -d "$srcdir/kwimy-astrovim/skel/.local/state/nvim" ]]; then
    cp -a "$srcdir/kwimy-astrovim/skel/.local/state/nvim" \
      "$pkgdir/etc/skel/.local/state/"
  fi
}
