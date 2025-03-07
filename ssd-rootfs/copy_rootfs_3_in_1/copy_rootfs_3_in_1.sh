#!/bin/bash

parted_dev=""
mount_dev=""
umount_dev=""

function Usag()
{
	echo "usag: "
	echo "     copy_rootfs.sh /dev/sda"
	echo "     copy_rootfs.sh /dev/nvme0n1"
	echo "     copy_rootfs.sh /dev/mmcblk0"
}

if [ $# -ne 1 ];then
	Usag
	exit
fi

if [[ $1 =~ "/dev/sd" ]];then
	parted_dev="$1"
        mount_dev="$11"
elif [[ $1 =~ "/dev/nvme0n1" ]];then
	parted_dev="$1"
        mount_dev="$1p1"
elif [[ $1 =~ "/dev/mmcblk" ]];then
	parted_dev="$1"
        mount_dev="$1p1"
else
	Usag
	exit
fi

umount_dev=`ls $parted_dev*`
for var in $umount_dev
do
	echo "nvidia" | sudo -S umount $var
done

echo "nvidia" | sudo -S parted -s $parted_dev mklabel gpt;
if [ $? -ne 0 ];then
	echo "error: mklable gpt."
	exit
fi

echo "nvidia" | sudo -S parted -s $parted_dev mkpart primary 2048s 100%;
if [ $? -ne 0 ];then
	echo "error: mkpart primary."
	exit
fi

echo "nvidia" | sudo -S mkfs.ext4 -F $mount_dev;
if [ $? -ne 0 ];then
	echo "error: mkfs.ext4."
	exit
fi

echo "nvidia" | sudo -S mount $mount_dev /mnt;
if [ $? -ne 0 ];then
	echo "error: mount"
	exit
fi

echo "nvidia" | sudo -S rsync -aAXv / --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/user/","/mnt/","/media/*","/lost+found"} /mnt;
if [ $? -ne 0 ];then
	echo "error: rsync error, pleas check file"
	exit
fi

echo "nvidia" | sudo -S umount $mount_dev
if [ $? -ne 0 ];then
	echo "error: umount"
	exit
fi

exit

