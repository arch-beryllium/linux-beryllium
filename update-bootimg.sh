#!/bin/bash
echo "Generating new boot.img"
# See https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/testing/device-xiaomi-beryllium/deviceinfo for values
mkbootimg \
  --kernel /boot/Image.gz-dtb \
  --ramdisk /boot/initramfs-linux.img \
  --base 0x00000000 \
  --second_offset 0x00f00000 \
  --kernel_offset 0x00008000 \
  --ramdisk_offset 0x01000000 \
  --tags_offset 0x00000100 \
  --pagesize 4096 \
  --cmdline "root=LABEL=ALARM rw audit=0 bootsplash.bootfile=bootsplash" \
  -o /boot/boot.img

if [ -e /dev/disk/by-partlabel/boot ]; then
  echo "Running on the device"

  dir=$(mktemp -d)
  cmdline=$(unpack_bootimg --boot_img "$(readlink -f /dev/disk/by-partlabel/boot)" --out "$dir" | grep -E "^command line args")
  rm -rf "$dir"

  if [[ $cmdline == *"ALARM"* ]]; then
    echo "Running with permanent boot.img"
    echo "Flashing new boot.img"
    dd if=/boot/boot.img of="$(readlink -f /dev/disk/by-partlabel/boot)"
  else
    echo "Running with temporary boot.img"
    echo "Skip flashing new boot.img"
  fi
else
  echo "Not running on the device"
  echo "Skip flashing new boot.img"
fi
