#!/bin/bash
sudo mv /boot/extlinux/extlinux.conf /boot/extlinux/extlinux.conf.b
cat >> /boot/extlinux/extlinux.conf << HERE
TIMEOUT 30
DEFAULT primary

MENU TITLE L4T boot options

LABEL primary
      MENU LABEL primary kernel
      LINUX /boot/Image
      #FDT /boot/dtb/kernel_tegra234-p3701-0004-p3737-0000.dtb
      INITRD /boot/initrd
      APPEND ${cbootargs} root=/dev/nvme0n1p1 rw rootwait rootfstype=ext4 mminit_loglevel=8 console=ttyTCU0,115200 console=ttyAMA0,115200 console=tty0 firmware_class.path=/etc/firmware fbcon=map:0 net.ifnames=0 

# When testing a custom kernel, it is recommended that you create a backup of
# the original kernel and add a new entry to this file so that the device can
# fallback to the original kernel. To do this:
#
# 1, Make a backup of the original kernel
#      sudo cp /boot/Image /boot/Image.backup
#
# 2, Copy your custom kernel into /boot/Image
#
# 3, Uncomment below menu setting lines for the original kernel
#
# 4, Reboot

# LABEL backup
#    MENU LABEL backup kernel
#    LINUX /boot/Image.backup
#    FDT /boot/dtb/kernel_tegra234-p3701-0004-p3737-0000.dtb
#    INITRD /boot/initrd
#    APPEND ${cbootargs}
HERE
