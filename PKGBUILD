pkgbase=linux-beryllium
_srcname=sdm845-linux
_kernelname=${pkgbase#linux}
_desc="Xiaomi Beryllium"
pkgver=5.11.0
pkgrel=2
arch=('aarch64')
url="https://gitlab.com/sdm845-mainline/sdm845-linux/-/tree/sdm845-stable"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'dtc' 'cpio')
options=('!strip')
source=('git+https://gitlab.com/sdm845-mainline/sdm845-linux.git#branch=sdm845-stable'
        'extra_config'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook'
        '91-linux.hook'
        'update-bootimg.sh'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0001-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0002-revert-fbcon-remove-no-op-fbcon_set_origin.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0003-revert-fbcon-remove-soft-scrollback-code.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0001-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0002-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0003-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0004-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0005-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0006-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0007-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0008-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0009-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0010-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0011-bootsplash.patch'
        'https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/raw/5.11-megi/0012-bootsplash.patch')
sha256sums=('SKIP'
           'ce1b39d9441fbd59404a49e2b74fba7c0ee8c08fb712b8578882df4629da70d9'
           '66644820faa950a5fc59181f5aefcbed6d7ed652b29aee69979a2be2a032025d'
           'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
           '71df1b18a3885b151a3b9d926a91936da2acc90d5e27f1ad326745779cd3759d'
           '45e4faaad73b3067b4506f9ea4beb55cadc56e2f73cdf587042e0beca58da305'
           '77a02c42aebef0da34a691884f977a2e0d7d4a8c0e02270c9412cbc18245e3db'
           'ddf1e7fc55cc6fe81ecfcac84112e573ca95713c027bc84d69cf880812fd6ff3'
           '94a8538251ad148f1025cc3de446ce64f73dc32b01815426fb159c722e8fa5bc'
           '37a221c12b40122167b0a30b5a9f2fc99e2aeb94e4db58a719c2b30171c5aeb5'
           '59202940d4f12bad23c194a530edc900e066866c9945e39748484a6545af96de'
           'e096b127a5208f56d368d2cb938933454d7200d70c86b763aa22c38e0ddb8717'
           '8c1c880f2caa9c7ae43281a35410203887ea8eae750fe8d360d0c8bf80fcc6e0'
           '1144d51e5eb980fceeec16004f3645ed04a60fac9e0c7cf88a15c5c1e7a4b89e'
           'dd4b69def2efacf4a6c442202ad5cb93d492c03886d7c61de87696e5a83e2846'
           '028b07f0c954f70ca37237b62e04103e81f7c658bb8bd65d7d3c2ace301297dc'
           'a0c548c5703d25ae34b57931f1162de8b18937e676e5791a0f039922090881e7'
           '8dbb5ab3cb99e48d97d4e2f2e3df5d0de66f3721b4f7fd94a708089f53245c77'
           'a7aefeacf22c600fafd9e040a985a913643095db7272c296b77a0a651c6a140a'
           'e9f22cbb542591087d2d66dc6dc912b1434330ba3cd13d2df741d869a2c31e89'
           '27471eee564ca3149dd271b0817719b5565a9594dc4d884fe3dc51a5f03832bc'
           '60e295601e4fb33d9bf65f198c54c7eb07c0d1e91e2ad1e0dd6cd6e142cb266d')

pkgver() {
 cd ${_srcname}
 make kernelversion | cut -f 1 -d "-"
}

prepare() {
  cd ${_srcname}

  # Reset repo because otherwise the patches wouldn't apply on a dirty build
  git clean -fd
  git checkout .

  patch -Np1 -i "${srcdir}/0001-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch"
  patch -Np1 -i "${srcdir}/0002-revert-fbcon-remove-no-op-fbcon_set_origin.patch"
  patch -Np1 -i "${srcdir}/0003-revert-fbcon-remove-soft-scrollback-code.patch"
  patch -Np1 -i "${srcdir}/0001-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0002-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0003-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0004-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0005-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0006-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0007-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0008-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0009-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0010-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0011-bootsplash.patch"
  patch -Np1 -i "${srcdir}/0012-bootsplash.patch"

  make defconfig sdm845.config
  cat ../extra_config >> .config
  make olddefconfig

  # add pkgrel to extraversion
  sed -ri "s|^(EXTRAVERSION =)(.*)|\1 \2-${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh
}

build() {
  cd ${_srcname}
  unset LDFLAGS
  make ${MAKEFLAGS} Image Image.gz modules
  make ${MAKEFLAGS} DTC_FLAGS="-@" dtbs
  cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb >arch/arm64/boot/Image.gz-dtb
}

_package() {
  pkgdesc="The Linux Kernel and modules - ${_desc}"
  depends=('coreutils' 'firmware-xiaomi-beryllium' 'kmod' 'mkinitcpio>=0.7' 'mkbootimg-tools')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("linux=${pkgver}" "WIREGUARD-MODULE")
  replaces=('linux-armv8')
  conflicts=('linux' 'linux-aarch64')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=${pkgname}.install

  cd ${_srcname}

  KARCH=arm64

  # get kernel version
  _kernver="$(make kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  cp arch/$KARCH/boot/Image{,.gz,.gz-dtb} "${pkgdir}/boot"

  # make room for external modules
  local _extramodules="extramodules-${_basekernel}${_kernelname}"
  ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  # remove build and source links
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

  # now we call depmod...
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"

  # add vmlinux
  install -Dt "${pkgdir}/usr/lib/modules/${_kernver}/build" -m644 vmlinux

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%KERNVER%|${_kernver}|g
    s|%EXTRAMODULES%|${_extramodules}|g
  "

  # install mkinitcpio preset file
  sed "${_subst}" ../linux.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" ../60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ../90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
  sed "${_subst}" ../91-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/91-${pkgbase}.hook"
  sed "${_subst}" ../update-bootimg.sh |
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/update-bootimg"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel - ${_desc}"
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-headers' 'linux-aarch64-headers')

  cd ${_srcname}
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/${KARCH}" -m644 arch/${KARCH}/Makefile
  install -Dt "${_builddir}/arch/${KARCH}/kernel" -m644 arch/${KARCH}/kernel/asm-offsets.s #arch/$KARCH/kernel/module.lds

  cp -t "${_builddir}/arch/${KARCH}" -a arch/${KARCH}/include
  mkdir -p "${_builddir}/arch/arm"
  cp -t "${_builddir}/arch/arm" -a arch/arm/include

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */${KARCH}/ || ${_arch} == */arm/ ]] && continue
    rm -r "${_arch}"
  done

  # remove files already in linux-docs package
  rm -r "${_builddir}/Documentation"

  # remove now broken symlinks
  find -L "${_builddir}" -type l -printf 'Removing %P\n' -delete

  # Fix permissions
  chmod -R u=rwX,go=rX "${_builddir}"

  # strip scripts directory
  local _binary _strip
  while read -rd '' _binary; do
    case "$(file -bi "${_binary}")" in
      *application/x-sharedlib*)  _strip="${STRIP_SHARED}"   ;; # Libraries (.so)
      *application/x-archive*)    _strip="${STRIP_STATIC}"   ;; # Libraries (.a)
      *application/x-executable*) _strip="${STRIP_BINARIES}" ;; # Binaries
      *) continue ;;
    esac
    /usr/bin/strip ${_strip} "${_binary}"
  done < <(find "${_builddir}/scripts" -type f -perm -u+w -print0 2>/dev/null)
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    _package${_p#${pkgbase}}
  }"
done
