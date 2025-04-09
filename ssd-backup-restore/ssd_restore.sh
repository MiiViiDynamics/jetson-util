#!/bin/bash

sudo parted -s /dev/nvme0n1 mklabel gpt
sudo parted -s /dev/nvme0n1 mkpart primary 2048s 100%
sudo mkfs.ext4 -F /dev/nvme0n1p1
sudo mount /dev/nvme0n1p1 /mnt

sudo tar -xvf ssd_backup.tar -C /mnt/
