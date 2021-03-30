#!/bin/bash

echo "Generating new boot.img's"
# See https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/testing/device-xiaomi-beryllium/deviceinfo for values
for panel in tianma ebbg; do
  mkbootimg \
    --kernel /boot/Image-"$panel".gz-dtb \
    --ramdisk /boot/initramfs-linux.img \
    --base 0x00000000 \
    --second_offset 0x00f00000 \
    --kernel_offset 0x00008000 \
    --ramdisk_offset 0x01000000 \
    --tags_offset 0x00000100 \
    --pagesize 4096 \
    --cmdline "root=LABEL=ALARM rw audit=0 bootsplash.bootfile=bootsplash" \
    -o /boot/boot-"$panel".img
done

if [ -e /dev/disk/by-partlabel/boot ]; then
  echo "Running on the device"

  # We need to detect which panel is used from the currently booted dtb, so we can flash the appropriate new boot.img
  # This is hardcoded as it likely won't change in the future (but maybe some fallback would be a good idea?)
  model="$(cut -d "," -f 1 </sys/firmware/devicetree/base/soc\@0/mdss\@ae00000/dsi\@ae94000/panel\@0/compatible)"
  if [ "$model" == "" ]; then
    echo "Failed to detect panel type"
    echo "Please manually flash /boot/boot-tianma.img or /boot/boot-ebbg.img using dd depending on which panel type you have:"
    for panel in tianma ebbg; do
      echo "dd if=/boot/boot-$panel.img of=$(readlink -f /dev/disk/by-partlabel/boot)"
    done
    exit 1
  fi
  echo "Detected $model panel"

  dir=$(mktemp -d)
  cmdline=$(unpack_bootimg --boot_img "$(readlink -f /dev/disk/by-partlabel/boot)" --out "$dir" | grep -E "^command line args")
  rm -rf "$dir"

  if [[ $cmdline == *"ALARM"* ]]; then
    echo "Running with permanent boot.img"
    echo "Flashing new $model boot.img"
    dd if=/boot/boot-"$model".img of="$(readlink -f /dev/disk/by-partlabel/boot)"
  else
    echo "Running with temporary boot.img"
    echo "Skip flashing new boot.img"
  fi
else
  echo "Not running on the device"
  echo "Skip flashing new boot.img"
fi
